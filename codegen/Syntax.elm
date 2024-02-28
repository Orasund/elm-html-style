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
    | Function String Syntax


type MultiplierSyntax
    = Multiple { min : Int, max : Maybe Int }
    | MultipleCommaSeperatedMinOne
    | NonEmpty


type ElementSyntax
    = Brackets Syntax
    | ValueElem ValueSyntax


type SequenceSyntax
    = Sequence (List ( ElementSyntax, Maybe MultiplierSyntax ))
    | Set (List ( ElementSyntax, Maybe MultiplierSyntax ))


type Syntax
    = Or SequenceSyntax (Maybe Syntax)


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
        , Parser.succeed Type
            |. Parser.symbol "<"
            |= keyword
            |. Parser.oneOf
                [ Parser.succeed ()
                    |. Parser.symbol " ["
                    |. Parser.variable
                        { start = \char -> char /= ']'
                        , inner = \char -> char /= ']'
                        , reserved = Set.empty
                        }
                    |. Parser.symbol "]>"
                , Parser.symbol ">"
                ]
        , Parser.succeed (SpecialChar '/')
            |. Parser.symbol "/"
        , keyword
            |> Parser.andThen
                (\v ->
                    Parser.oneOf
                        [ Parser.succeed (Function v)
                            |. Parser.symbol "("
                            |= Parser.lazy (\() -> parser)
                            |. Parser.symbol ")"
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
        , Parser.succeed (\min max -> Multiple { min = min, max = Just max } |> Just)
            |. Parser.symbol "{"
            |= Parser.int
            |. Parser.symbol ","
            |= Parser.int
            |. Parser.symbol "}"
        , Parser.succeed (MultipleCommaSeperatedMinOne |> Just)
            |. Parser.symbol "#"
        , Parser.succeed (NonEmpty |> Just)
            |. Parser.symbol "!"
        , Parser.succeed Nothing
        ]


parser : Parser Syntax
parser =
    valueWihMultiplier
        |> Parser.map List.singleton
        |> Parser.andThen collectHeadAndProceed


valueWihMultiplier =
    Parser.oneOf
        [ Parser.succeed (\syntax maybeMultiplier -> ( Brackets syntax, maybeMultiplier ))
            |. Parser.symbol "["
            |. Parser.spaces
            |= Parser.lazy (\() -> parser)
            |= multiplier
        , Parser.succeed (\value mult -> ( ValueElem value, mult ))
            |= valueParser
            |= multiplier
        ]


collectHeadAndProceed list =
    Parser.oneOf
        [ Parser.succeed identity
            |. Parser.symbol " "
            |= Parser.oneOf
                [ Parser.succeed (Or (Sequence (List.reverse list)) Nothing)
                    |. Parser.symbol "]"
                , Parser.succeed identity
                    |. Parser.symbol "|"
                    |= Parser.oneOf
                        [ (Parser.succeed identity
                            |. Parser.symbol "| "
                            |= valueWihMultiplier
                          )
                            |> Parser.andThen
                                (\v2 ->
                                    v2 :: list |> collectSet
                                )
                        , Parser.succeed (\v2 -> Or (Sequence (List.reverse list)) (Just v2))
                            |. Parser.symbol " "
                            |= Parser.lazy (\() -> parser)
                        ]
                , valueWihMultiplier
                    |> Parser.andThen
                        (\v2 ->
                            v2 :: list |> collectSequence
                        )
                ]
        , Parser.succeed (Or (Sequence (List.reverse list)) Nothing)
        ]


collectSequence list =
    Parser.oneOf
        [ Parser.succeed identity
            |. Parser.symbol " "
            |= Parser.oneOf
                [ Parser.succeed (Or (Sequence (List.reverse list)) Nothing)
                    |. Parser.symbol "]"
                , Parser.succeed identity
                    |. Parser.symbol "|"
                    |= Parser.oneOf
                        [ Parser.succeed (\v2 -> Or (Sequence (List.reverse list)) (Just v2))
                            |. Parser.symbol " "
                            |= Parser.lazy (\() -> parser)
                        ]
                , valueWihMultiplier
                    |> Parser.andThen
                        (\v2 ->
                            v2 :: list |> collectSequence
                        )
                ]
        , Parser.succeed (Or (Sequence (List.reverse list)) Nothing)
        ]


collectSet list =
    Parser.oneOf
        [ Parser.succeed identity
            |. Parser.symbol " "
            |= Parser.oneOf
                [ Parser.succeed (Or (Set (List.reverse list)) Nothing)
                    |. Parser.symbol "]"
                , Parser.succeed identity
                    |. Parser.symbol "|"
                    |= Parser.oneOf
                        [ (Parser.succeed identity
                            |. Parser.symbol "| "
                            |= valueWihMultiplier
                          )
                            |> Parser.andThen
                                (\v2 ->
                                    v2 :: list |> collectSet
                                )
                        , Parser.succeed (\v2 -> Or (Set (List.reverse list)) (Just v2))
                            |. Parser.symbol " "
                            |= Parser.lazy (\() -> parser)
                        ]
                ]
        , Parser.succeed (Or (Set (List.reverse list)) Nothing)
        ]
