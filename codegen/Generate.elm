module Generate exposing (main)

{-| -}

import Dict exposing (Dict)
import Elm
import Gen.CodeGen.Generate as Generate
import Json.Decode
import Property exposing (Property)


main : Program Json.Decode.Value () ()
main =
    Generate.fromJson decodeFiles generate


decodeProperties : Json.Decode.Decoder (Dict String Property)
decodeProperties =
    Property.decode
        |> Json.Decode.dict


decodeFiles : Json.Decode.Decoder (Dict String Property)
decodeFiles =
    Json.Decode.field "properties" decodeProperties


generate : Dict String Property -> List Elm.File
generate files =
    [ Elm.fileWith [ "Html", "Style" ]
        { docs =
            \list ->
                [ "This module helps you write CSS in Elm."
                , "```\nmaxWidth string = Html.Attributes.style \"max-width\" string\n```"
                , "There are also shorthands for setting a property to a constant."
                , "```\nmaxWidthMaxContent = Html.Attributes.style \"max-width\" \"max-content\"\n```"
                , "This file was generated from the [MDN data repository](https://github.com/mdn/data)."
                ]
                    ++ List.map Elm.docs list
        , aliases =
            []
        }
        (files
            |> Dict.toList
            |> List.filter
                (\( key, _ ) ->
                    key
                        |> String.startsWith "-"
                        |> not
                )
            |> List.concatMap Property.toDeclarations
        )
    ]
