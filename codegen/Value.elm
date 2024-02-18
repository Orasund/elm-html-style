module Value exposing (..)

import Dict exposing (Dict)
import Parser exposing ((|.), (|=), DeadEnd, Problem(..))
import Syntax exposing (ElementSyntax(..), MultiplierSyntax(..), SequenceSyntax(..), Syntax(..), Value(..), ValueSyntax(..))


collectValue : Dict String (List Value) -> ValueSyntax -> List Value
collectValue syntaxGroup valueSyntax =
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
                    syntaxGroup |> Dict.get t |> Maybe.withDefault []

        _ ->
            []


collectElem : Dict String (List Value) -> ElementSyntax -> List Value
collectElem syntaxGroup elementSyntax =
    case elementSyntax of
        ValueElem valueSyntax ->
            collectValue syntaxGroup valueSyntax

        Brackets syntax ->
            collectConstants syntaxGroup syntax


collectSequence : Dict String (List Value) -> SequenceSyntax -> List Value
collectSequence syntaxGroup sequenceSyntax =
    case sequenceSyntax of
        Sequence list ->
            case list of
                [ ( elem, Nothing ) ] ->
                    collectElem syntaxGroup elem

                [ ( elem, Just (Multiple args) ) ] ->
                    case ( args.min, args.max ) of
                        ( 1, _ ) ->
                            --TODO implement more then one value
                            collectElem syntaxGroup elem--}

                        _ ->
                            []

                [ ( _, Just (Multiple args) ), ( elem2, Nothing ) ] ->
                    case ( args.min, args.max ) of
                        ( 0, Just 1 ) ->
                            --TODO implement case 1
                            collectElem syntaxGroup elem2

                        _ ->
                            []

                _ ->
                    []

        Set list ->
            --TODO support multiple values
            list
                |> List.concatMap
                    (\tuple ->
                        case tuple of
                            ( elem, Nothing ) ->
                                collectElem syntaxGroup elem

                            _ ->
                                []
                    )


collectConstants : Dict String (List Value) -> Syntax -> List Value
collectConstants syntaxGroup syntax =
    case syntax of
        Or sequenceSyntax maybeSyntax ->
            collectSequence syntaxGroup sequenceSyntax
                |> (++)
                    (maybeSyntax
                        |> Maybe.map (collectConstants syntaxGroup)
                        |> Maybe.withDefault []
                    )
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


parse : Dict String (List Value) -> String -> List Value
parse syntaxGroup string =
    case
        string
            |> Parser.run
                (Parser.succeed identity
                    |= Syntax.parser
                    |. Parser.end
                )
    of
        Ok a ->
            collectConstants syntaxGroup a

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
