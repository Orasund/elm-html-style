module Syntax exposing (..)

{-| <https://developer.mozilla.org/en-US/docs/Web/CSS/Value_definition_syntax>
-}

import Parser exposing ((|.), (|=), DeadEnd, Parser, Problem(..))
import Set


type ValueSyntax
    = Keyword String
    | Type String
    | Function String Syntax


type MultiplierSyntax
    = Multible { min : Int, max : Maybe Int }
    | MultibleCommaSeperatedMinOne
    | NonEmpty


type ElementSyntax
    = Brackets ( Syntax, Maybe MultiplierSyntax )
    | ValueElem ( ValueSyntax, Maybe MultiplierSyntax )


type Syntax
    = And (List ElementSyntax)
    | Or (List ElementSyntax) Syntax


reservedCharacters =
    [ ' ', '&', '|', '<', '>', '(', ')', '[', ']', '{', '}', '*', '+', '?', '#', '!' ]


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
        [ Parser.succeed Type
            |. Parser.symbol "<"
            |= keyword
            |. Parser.symbol ">"
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
        [ Parser.succeed (Multible { min = 0, max = Nothing } |> Just)
            |. Parser.symbol "*"
        , Parser.succeed (Multible { min = 1, max = Nothing } |> Just)
            |. Parser.symbol "+"
        , Parser.succeed (Multible { min = 0, max = Just 1 } |> Just)
            |. Parser.symbol "?"
        , Parser.succeed (\min max -> Multible { min = min, max = Just max } |> Just)
            |. Parser.symbol "{"
            |= Parser.int
            |. Parser.symbol ","
            |= Parser.int
            |. Parser.symbol "}"
        , Parser.succeed (MultibleCommaSeperatedMinOne |> Just)
            |. Parser.symbol "#"
        , Parser.succeed (NonEmpty |> Just)
            |. Parser.symbol "!"
        , Parser.succeed Nothing
        ]


parser : Parser Syntax
parser =
    valueWihMultiplier
        |> Parser.map List.singleton
        |> Parser.andThen collect


valueWihMultiplier =
    Parser.oneOf
        [ Parser.succeed (\syntax maybeMultiplier -> Brackets ( syntax, maybeMultiplier ))
            |. Parser.symbol "["
            |. Parser.spaces
            |= Parser.lazy (\() -> parser)
            |. Parser.spaces
            |. Parser.symbol "]"
            |= multiplier
        , Parser.succeed (\value mult -> ValueElem ( value, mult ))
            |= valueParser
            |= multiplier
        ]


collect list =
    Parser.oneOf
        [ Parser.succeed identity
            |. Parser.symbol " "
            |= Parser.oneOf
                [ Parser.succeed (\v2 -> Or (List.reverse list) v2)
                    |. Parser.symbol "| "
                    |= Parser.lazy (\() -> parser)
                , (Parser.succeed (\syntax maybeMultiplier -> Brackets ( syntax, maybeMultiplier ))
                    |. Parser.symbol "["
                    |. Parser.spaces
                    |= Parser.lazy (\() -> parser)
                    |. Parser.spaces
                    |. Parser.symbol "]"
                    |= multiplier
                  )
                    |> Parser.andThen
                        (\v2 ->
                            v2 :: list |> collect
                        )
                , valueWihMultiplier
                    |> Parser.andThen
                        (\v2 ->
                            v2 :: list |> collect
                        )
                ]
        , Parser.succeed (And (List.reverse list))
        ]
