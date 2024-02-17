module Value exposing (..)

import Parser exposing ((|.), (|=), DeadEnd, Parser, Problem(..))
import Set
import Syntax exposing (ElementSyntax(..), MultiplierSyntax, Syntax(..), Value(..), ValueSyntax(..))


collectValue : ValueSyntax -> List Value
collectValue valueSyntax =
    case valueSyntax of
        Keyword v ->
            [ Constant v ]

        Type t ->
            case t of
                "length" ->
                    [ Unit "px"
                    , Unit "rem"
                    ]

                _ ->
                    []

        _ ->
            []


collectSequence : List ElementSyntax -> List Value
collectSequence list =
    case list of
        [ elem ] ->
            collectElem elem

        _ ->
            []


collectElem : ElementSyntax -> List Value
collectElem elementSyntax =
    case elementSyntax of
        ValueElem ( valueSyntax, Nothing ) ->
            collectValue valueSyntax

        ValueElem _ ->
            []

        Brackets _ ->
            []


collectConstants : Syntax -> List Value
collectConstants syntax =
    case syntax of
        And sequenceSyntax ->
            collectSequence sequenceSyntax

        Or sequenceSyntax s ->
            collectSequence sequenceSyntax
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


constants : String -> List Value
constants string =
    case
        string
            |> Parser.run
                (Parser.succeed identity
                    |= Syntax.parser
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
