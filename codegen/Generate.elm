module Generate exposing (main)

{-| -}

import Elm
import Gen.CodeGen.Generate as Generate
import Json.Decode
import Dict exposing (Dict)
import Gen.Html.Attributes
import Property

main : Program Json.Decode.Value () ()
main =
    Generate.fromJson (decodeFiles) generate

decodeProperties : Json.Decode.Decoder (Dict String ())
decodeProperties =
    Json.Decode.dict (Json.Decode.succeed ())


decodeFiles : Json.Decode.Decoder (Dict String ())
decodeFiles =
    (Json.Decode.field "properties" decodeProperties)


generate : Dict String () -> List Elm.File
generate files =
     [ Elm.file [ "Html","Style" ]
        (files 
        |> (Dict.keys)
        |> List.filter (\key -> key
        |> String.startsWith "-"
        |> not)
        |> List.map Property.toDeclaration )
    ]


