module Value exposing (..)

{-| <https://developer.mozilla.org/en-US/docs/Web/CSS/Value_definition_syntax>
-}

import Name
import Parser exposing ((|.), (|=), DeadEnd, Parser, Problem(..))
import Set


type ValueSyntax
    = Keyword String
    | Type String
    | Function String Syntax


type MultiplierSyntax
    = Multible { min : Int, max : Maybe Int } ValueSyntax
    | MultibleCommaSeperatedMinOne ValueSyntax
    | NonEmpty ValueSyntax
    | One ValueSyntax


type SequenceSyntax
    = Value MultiplierSyntax
    | And MultiplierSyntax SequenceSyntax


type Syntax
    = Singleton ValueSyntax
    | Or ValueSyntax Syntax


reservedCharacters =
    [ ' ', '&', '|', '<', '>', '(', ')', '[', ']', '{', '}', '*', '+', '?', '#', '!' ]


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


value : Parser MultiplierSyntax
value =
    valueParser
        |> Parser.andThen
            (\v ->
                Parser.oneOf
                    [ Parser.succeed (Multible { min = 0, max = Nothing } v)
                        |. Parser.symbol "*"
                    , Parser.succeed (Multible { min = 1, max = Nothing } v)
                        |. Parser.symbol "+"
                    , Parser.succeed (Multible { min = 0, max = Just 1 } v)
                        |. Parser.symbol "?"
                    , Parser.succeed (\min max -> Multible { min = min, max = Just max } v)
                        |. Parser.symbol "{"
                        |= Parser.int
                        |. Parser.symbol ","
                        |= Parser.int
                        |. Parser.symbol "}"
                    , Parser.succeed (MultibleCommaSeperatedMinOne v)
                        |. Parser.symbol "#"
                    , Parser.succeed (NonEmpty v)
                        |. Parser.symbol "!"
                    , Parser.succeed (One v)
                    ]
            )


sequence : Parser SequenceSyntax
sequence =
    value
        |> Parser.andThen
            (\v ->
                Parser.oneOf
                    [ Parser.succeed (And v)
                        |. Parser.symbol " "
                        |= Parser.lazy (\() -> sequence)
                    , Parser.succeed (Value v)
                    ]
            )


parser : Parser Syntax
parser =
    valueParser
        |> Parser.andThen
            (\v ->
                Parser.oneOf
                    [ Parser.succeed (Or v)
                        |. Parser.spaces
                        |. Parser.symbol "|"
                        |. Parser.spaces
                        |= Parser.lazy (\() -> parser)
                    , Parser.succeed (Singleton v)
                    ]
            )


collectValue : ValueSyntax -> List String
collectValue valueSyntax =
    case valueSyntax of
        Keyword v ->
            [ v ]

        _ ->
            []


collectSequence : SequenceSyntax -> List String
collectSequence sequenceSyntax =
    case sequenceSyntax of
        Value multiplierSyntax ->
            case multiplierSyntax of
                One valueSyntax ->
                    collectValue valueSyntax

                _ ->
                    []

        And _ _ ->
            []


collectConstants : Syntax -> List String
collectConstants syntax =
    case syntax of
        Singleton sequenceSyntax ->
            collectValue sequenceSyntax

        Or sequenceSyntax s ->
            collectValue sequenceSyntax
                |> (++) (collectConstants s)
                |> List.reverse


deadEndsToString : List DeadEnd -> String
deadEndsToString deadEnds =
    let
        deadEndToString : DeadEnd -> String
        deadEndToString deadEnd =
            let
                position : String
                position =
                    "row:" ++ String.fromInt deadEnd.row ++ " col:" ++ String.fromInt deadEnd.col ++ "\n"
            in
            case deadEnd.problem of
                Expecting str ->
                    "Expecting " ++ str ++ "at " ++ position

                ExpectingInt ->
                    "ExpectingInt at " ++ position

                ExpectingHex ->
                    "ExpectingHex at " ++ position

                ExpectingOctal ->
                    "ExpectingOctal at " ++ position

                ExpectingBinary ->
                    "ExpectingBinary at " ++ position

                ExpectingFloat ->
                    "ExpectingFloat at " ++ position

                ExpectingNumber ->
                    "ExpectingNumber at " ++ position

                ExpectingVariable ->
                    "ExpectingVariable at " ++ position

                ExpectingSymbol str ->
                    "ExpectingSymbol " ++ str ++ " at " ++ position

                ExpectingKeyword str ->
                    "ExpectingKeyword " ++ str ++ "at " ++ position

                ExpectingEnd ->
                    "ExpectingEnd at " ++ position

                UnexpectedChar ->
                    "UnexpectedChar at " ++ position

                Problem str ->
                    "ProblemString " ++ str ++ " at " ++ position

                BadRepeat ->
                    "BadRepeat at " ++ position
    in
    List.foldl (++) "" (List.map deadEndToString deadEnds)


constants : String -> List String
constants string =
    case
        string
            |> Parser.run
                (Parser.succeed identity
                    |= parser
                    |. Parser.end
                )
    of
        Ok a ->
            collectConstants a

        {--|> List.filter
                    (String.all
                        (\char ->
                            Char.isAlpha char || char == '='
                        )
                    )--}
        Err err ->
            let
                _ =
                    Debug.log string (deadEndsToString err)
            in
            []
