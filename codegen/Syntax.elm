module Syntax exposing (..)

{-| <https://developer.mozilla.org/en-US/docs/Web/CSS/Value_definition_syntax>
-}

import Parser exposing ((|.), (|=), Parser, Problem(..))
import Set


type ValueSyntax
    = Keyword String
    | SpecialChar Char
    | Reference String
    | Type String
    | Function String (List Syntax)


type MultiplierSyntax
    = Multiple { min : Int, max : Maybe Int }
    | MultipleCommaSeperatedMinOne
    | NonEmpty


type ElementSyntax
    = Brackets Syntax
    | ValueElem ValueSyntax


type SequenceSyntax
    = Ordered (List ( ElementSyntax, Maybe MultiplierSyntax ))
    | Unordered (List ( ElementSyntax, Maybe MultiplierSyntax ))


type SetSyntax
    = Set (List SequenceSyntax)


type Syntax
    = Or (List SetSyntax)


reservedCharacters =
    [ ' ', '&', '|', '<', '>', '(', ')', '[', ']', '{', '}', '*', '+', '?', '#', '!', '\'' ]


type Value
    = Constant String
    | Unit String


keyword : Parser String
keyword =
    Parser.variable
        { start = \char -> Char.isAlpha char || char == '-'
        , inner = \char -> List.member char reservedCharacters |> not
        , reserved = Set.empty
        }


valueParser : Parser ValueSyntax
valueParser =
    Parser.oneOf
        [ Parser.succeed Reference
            |. Parser.symbol "<'"
            |= keyword
            |. Parser.symbol "'>"
        , Parser.succeed (\str1 str2 -> Type (str1 ++ str2))
            |. Parser.symbol "<"
            |= keyword
            |= Parser.oneOf
                [ Parser.succeed ("()")
                    |. Parser.symbol "()",
                 Parser.succeed ""
                    
                    |. Parser.symbol " ["
                    |. Parser.variable
                        { start = \char -> char /= ']'
                        , inner = \char -> char /= ']'
                        , reserved = Set.empty
                        }
                    |. Parser.symbol "]"
                , Parser.succeed ""
                ]
            |. Parser.symbol ">"
        , Parser.succeed (SpecialChar '/')
            |. Parser.symbol "/"
        , Parser.succeed (SpecialChar ',')
            |. Parser.symbol ","
        , keyword
            |> Parser.andThen
                (\v ->
                    Parser.oneOf
                        [ Parser.succeed (Function v)
                            |= Parser.sequence
                                { start = "("
                                , separator =","
                                ,end = ")"
                                ,spaces = Parser.spaces
                                ,item =Parser.lazy (\() -> parser)
                                ,trailing = Parser.Forbidden
                                }
                        , Parser.succeed (Keyword v)
                        ]
                )
        ]


multiplier : Parser (Maybe MultiplierSyntax)
multiplier =
    Parser.oneOf
        [ Parser.succeed (Multiple { min = 0, max = Nothing } |> Just)
            |. Parser.symbol "*"
        , Parser.succeed (Multiple { min = 1, max = Nothing } |> Just)
            |. Parser.symbol "+"
        , Parser.succeed (Multiple { min = 0, max = Just 1 } |> Just)
            |. Parser.symbol "?"
        , Parser.succeed (\min maybeMax -> Multiple { min = min, max = maybeMax |> Maybe.withDefault min |> Just } |> Just)
            |. Parser.symbol "{"
            |= Parser.int
            |= Parser.oneOf 
                [ Parser.succeed Just
                    |. Parser.symbol ","
                    |= Parser.int
                    |. Parser.symbol "}"
                , Parser.succeed Nothing
                    |. Parser.symbol "}"

                ]
        , Parser.succeed (MultipleCommaSeperatedMinOne |> Just)
            |. Parser.symbol "#"
        , Parser.succeed (NonEmpty |> Just)
            |. Parser.symbol "!"
        , Parser.succeed Nothing
        ]


valueWihMultiplier =
    Parser.oneOf
        [ Parser.succeed (\syntax maybeMultiplier -> ( Brackets syntax, maybeMultiplier ))
            |. Parser.symbol "["
            |. Parser.spaces
            |= Parser.lazy (\() -> parser)
            |. Parser.spaces
            |. Parser.symbol "]"
            |= multiplier
        , Parser.succeed (\value mult -> ( ValueElem value, mult ))
            |= valueParser
            |= multiplier
        ]


collectSequence : Parser SequenceSyntax
collectSequence =
    valueWihMultiplier
        |> Parser.andThen
            (\v ->
                Parser.oneOf
                    [ Parser.succeed identity
                        |. Parser.symbol " && "
                        |= valueWihMultiplier
                        |> Parser.andThen
                            (\v2 ->
                                [ v2, v ] |> collectUnorderedSequence
                            )
                    , Parser.backtrackable
                        (Parser.succeed identity
                            |. Parser.symbol " "
                            |= valueWihMultiplier
                            |> Parser.andThen
                                (\v2 ->
                                    [ v2, v ] |> collectOrderedSequence
                                )
                        )
                    , Parser.succeed (Ordered (List.reverse [ v ]))
                    ]
            )


collectOrderedSequence : List ( ElementSyntax, Maybe MultiplierSyntax ) -> Parser SequenceSyntax
collectOrderedSequence list =
    Parser.oneOf
        [ Parser.backtrackable
            (Parser.succeed identity
                |. Parser.symbol " "
                |= valueWihMultiplier
                |> Parser.andThen
                    (\v2 ->
                        v2 :: list |> collectOrderedSequence
                    )
            )
        , Parser.succeed (Ordered (List.reverse list))
        ]


collectUnorderedSequence : List ( ElementSyntax, Maybe MultiplierSyntax ) -> Parser SequenceSyntax
collectUnorderedSequence list =
    Parser.oneOf
        [ Parser.succeed identity
            |. Parser.symbol " && "
            |= valueWihMultiplier
            |> Parser.andThen
                (\v2 ->
                    v2 :: list |> collectUnorderedSequence
                )
        , Parser.succeed (Unordered (List.reverse list))
        ]


collectSet : List SequenceSyntax -> Parser SetSyntax
collectSet list =
    Parser.oneOf
        [ Parser.succeed identity
            |. Parser.symbol " || "
            |= Parser.oneOf
                [ collectSequence
                    |> Parser.andThen
                        (\v2 ->
                            v2 :: list |> collectSet
                        )
                ]
        , Parser.succeed (Set (list |> List.reverse))
        ]


collectOr list =
    Parser.oneOf
        [ Parser.succeed identity
            |. Parser.symbol " | "
            |= Parser.oneOf
                [ collectSequence
                    |> Parser.map List.singleton
                    |> Parser.andThen collectSet
                    |> Parser.andThen
                        (\v2 ->
                            v2 :: list |> collectOr
                        )
                ]
        , Parser.succeed (Or (list |> List.reverse))
        ]


parser : Parser Syntax
parser =
    collectSequence
        |> Parser.map List.singleton
        |> Parser.andThen collectSet
        |> Parser.map List.singleton
        |> Parser.andThen collectOr



{--
collectHeadAndProceed : ( ElementSyntax, Maybe MultiplierSyntax ) -> Syntax
collectHeadAndProceed v =
    Parser.oneOf
        [ Parser.succeed (Or (Set [ Sequence [ v ] ]) Nothing)
            |. Parser.symbol " ]"
        , Parser.succeed identity
            |. Parser.symbol " |"
            |= Parser.oneOf
                [ Parser.succeed (\v1 v2 -> Or v1 (Just v2))
                    |= ((Parser.succeed identity
                            |. Parser.symbol "| "
                            |= collectSequence [ v ]
                        )
                            |> Parser.andThen
                                (\v2 ->
                                    collectSet [ v2 ]
                                )
                       )
                    |. Parser.symbol " "
                    |= Parser.lazy (\() -> parser)
                , Parser.succeed (\v2 -> Or (Set [ Sequence [ v ] ]) (Just v2))
                    |. Parser.symbol " "
                    |= Parser.lazy (\() -> parser)
                ]
        , Parser.succeed (\v2 -> collectSequence [ v2 ])
            |. Parser.symbol " "
            |= Parser.lazy (\() -> parser)
        ]


collectSequence2 list =
    Parser.oneOf
        [ Parser.succeed identity
            |. Parser.symbol " "
            |= Parser.oneOf
                [ Parser.succeed (Or (Set [ Sequence (List.reverse list) ]) Nothing)
                    |. Parser.symbol "]"
                , Parser.succeed identity
                    |. Parser.symbol "|"
                    |= Parser.oneOf
                        [ Parser.succeed (\v2 -> Or (Set [ Sequence (List.reverse list) ]) (Just v2))
                            |. Parser.symbol " "
                            |= Parser.lazy (\() -> parser)
                        ]
                , valueWihMultiplier
                    |> Parser.andThen
                        (\v2 ->
                            v2 :: list |> collectSequence
                        )
                ]
        , Parser.succeed (Or (Set [ Sequence (List.reverse list) ]) Nothing)
        ]


collectSet2 : List ( ElementSyntax, Maybe MultiplierSyntax ) -> List SequenceSyntax -> Parser Syntax
collectSet2 head tail =
    Parser.oneOf
        [ Parser.succeed identity
            |= Parser.oneOf
                [ Parser.succeed (Or (Set (Sequence head :: tail |> List.reverse)) Nothing)
                    |. Parser.symbol " ]"
                , Parser.succeed identity
                    |. Parser.symbol " |"
                    |= Parser.oneOf
                        [ (Parser.succeed identity
                            |. Parser.symbol "| "
                            |= valueWihMultiplier
                          )
                            |> Parser.andThen
                                (\v2 ->
                                    Sequence head :: tail |> collectSet [ v2 ]
                                )
                        , Parser.succeed (\v2 -> Or (Set (Sequence head :: tail |> List.reverse)) (Just v2))
                            |. Parser.symbol " "
                            |= Parser.lazy (\() -> parser)
                        ]
                ]
        , Parser.succeed (Or (Set (Sequence head :: tail |> List.reverse)) Nothing)
        ]
--}