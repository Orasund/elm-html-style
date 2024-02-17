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
                [ "All functions have been generated from the [MDN data repository](https://github.com/mdn/data), ensuring that you can always use the most recent css features."
                ,"The following functions are currently generated:"
                ,"Generic functions returning a Html.Attributes\n```\nmaxWidth string =\n  Html.Attributes.style \"max-width\" string\n```"
                ,"Variants for constant values\n ```\nmaxWidthMaxContent =\n  Html.Attributes.style \"max-width\" \"max-content\"\n```"
                ,"Variants for lengths (currently only \"px\" and \"rem\")\n```maxWidthPx float =\n  Html.Attributes.style \"max-width\" (float ++ \"px\")\n```"
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
