module Generate exposing (main)

{-| -}

import Dict exposing (Dict)
import Elm
import File.PropertiesJson exposing (Property)
import File.SyntaxesJson
import Gen.CodeGen.Generate as Generate
import Json.Decode
import Property
import Syntax
import Value


type alias Flags =
    { properties : Dict String Property
    , syntaxes : Dict String String
    }


main : Program Json.Decode.Value () ()
main =
    Generate.fromJson flagsDecoder generate


flagsDecoder : Json.Decode.Decoder Flags
flagsDecoder =
    Json.Decode.map2
        (\properties syntaxes ->
            { properties = properties
            , syntaxes = syntaxes
            }
        )
        (Json.Decode.field "properties" File.PropertiesJson.fileDecoder)
        (Json.Decode.field "syntaxes" File.SyntaxesJson.fileDecoder)


generate : Flags -> List Elm.File
generate flags =
    let
        syntaxGroups =
            flags.syntaxes
                |> Dict.map (\_ -> Value.parse Dict.empty)
    in
    [ Elm.fileWith [ "Html", "Style" ]
        { docs =
            \list ->
                [ "All functions have been generated from the [MDN data repository](https://github.com/mdn/data), ensuring that you can always use the most recent css features."
                , "The following functions are currently generated:"
                , "Generic functions returning a Html.Attributes\n```\nmaxWidth string =\n  Html.Attributes.style \"max-width\" string\n```"
                , "Variants for constant values\n ```\nmaxWidthMaxContent =\n  Html.Attributes.style \"max-width\" \"max-content\"\n```"
                , "Variants for lengths (currently only \"px\" and \"rem\")\n```maxWidthPx float =\n  Html.Attributes.style \"max-width\" (float ++ \"px\")\n```"
                ]
                    ++ List.map Elm.docs list
        , aliases =
            []
        }
        (flags.properties
            |> Dict.toList
            |> List.filter
                (\( key, _ ) ->
                    key
                        |> String.startsWith "-"
                        |> not
                )
            |> List.concatMap (Property.toDeclarations syntaxGroups)
        )
    ]
