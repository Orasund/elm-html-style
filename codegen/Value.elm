module Value exposing (..)

import Dict exposing (Dict)
import List.Extra
import Parser exposing ((|.), (|=), DeadEnd, Problem(..))
import Syntax exposing (ElementSyntax(..), MultiplierSyntax(..), SequenceSyntax(..), SetSyntax(..), Syntax(..), Value(..), ValueSyntax(..))


collectValue : { syntaxGroups : Dict String (List Value), syntaxes : Dict String Syntax } -> ValueSyntax -> List Value
collectValue args valueSyntax =
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
                    args.syntaxGroups |> Dict.get t |> Maybe.withDefault []

        Reference key ->
            Dict.get key args.syntaxes
                |> Maybe.map (collectConstants args)
                |> Maybe.withDefault []

        _ ->
            []


collectElem : { syntaxGroups : Dict String (List Value), syntaxes : Dict String Syntax } -> ElementSyntax -> List Value
collectElem args elementSyntax =
    case elementSyntax of
        ValueElem valueSyntax ->
            collectValue args valueSyntax

        Brackets syntax ->
            collectConstants args syntax


collectSequence : { syntaxGroups : Dict String (List Value), syntaxes : Dict String Syntax } -> SequenceSyntax -> List Value
collectSequence args sequenceSyntax =
    let
        isOptional ( _, multiplier ) =
            case multiplier of
                Just (Multiple range) ->
                    case ( range.min, range.max ) of
                        ( 0, _ ) ->
                            True

                        _ ->
                            False

                Just MultipleCommaSeperatedMinOne ->
                    False

                Just NonEmpty ->
                    False

                Nothing ->
                    False
    in
    case sequenceSyntax of
        Sequence list ->
            case list of
                [ ( _, Just (Multiple range) ), ( elem2, Nothing ) ] ->
                    case ( range.min, range.max ) of
                        ( 0, _ ) ->
                            collectElem args elem2

                        _ ->
                            []

                ( elem1, Just (Multiple range1) ) :: tail ->
                    case range1.min of
                        1 ->
                            tail
                                |> List.all isOptional
                                |> (\bool ->
                                        if bool then
                                            collectElem args elem1

                                        else
                                            []
                                   )

                        _ ->
                            []

                ( elem, Nothing ) :: tail ->
                    tail
                        |> List.all isOptional
                        |> (\bool ->
                                if bool then
                                    collectElem args elem

                                else
                                    []
                           )

                ( elem, Just MultipleCommaSeperatedMinOne ) :: tail ->
                    tail
                        |> List.all isOptional
                        |> (\bool ->
                                if bool then
                                    collectElem args elem

                                else
                                    []
                           )

                ( elem, Just NonEmpty ) :: tail ->
                    tail
                        |> List.all isOptional
                        |> (\bool ->
                                if bool then
                                    collectElem args elem

                                else
                                    []
                           )

                _ ->
                    let
                        _ =
                            Debug.log "missing case" sequenceSyntax
                    in
                    []


collectSet : { syntaxGroups : Dict String (List Value), syntaxes : Dict String Syntax } -> SetSyntax -> List Value
collectSet args setSyntax =
    case setSyntax of
        Set list ->
            list
                |> List.concatMap (collectSequence args)


collectConstants : { syntaxGroups : Dict String (List Value), syntaxes : Dict String Syntax } -> Syntax -> List Value
collectConstants args syntax =
    case syntax of
        Or list ->
            list
                |> List.concatMap (collectSet args)
                |> List.Extra.unique
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


parse : String -> Maybe Syntax
parse string =
    case
        string
            |> Parser.run
                (Parser.succeed identity
                    |= Syntax.parser
                    |. Parser.end
                )
    of
        Ok a ->
            Just a

        Err err ->
            let
                _ =
                    Debug.log string (deadEndsToString err)
            in
            Nothing


build : Dict String (List Value) -> Dict String String -> Dict String (List Value)
build syntaxGroups dict =
    let
        syntaxes =
            dict
                |> Dict.toList
                |> List.filterMap
                    (\( key, string ) ->
                        string
                            |> parse
                            |> Maybe.map (Tuple.pair key)
                    )
                |> Dict.fromList
    in
    Dict.map
        (\_ ->
            collectConstants
                { syntaxGroups = syntaxGroups
                , syntaxes = syntaxes
                }
        )
        syntaxes
