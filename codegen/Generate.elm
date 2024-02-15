module Generate exposing (main)

{-| -}

import Elm
import Gen.CodeGen.Generate as Generate
import Json.Decode
import Dict exposing (Dict)

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
        |> List.map property )
    ]


property : String -> Elm.Declaration
property key =
       Elm.declaration (getFileName key)
            (Elm.string "test")
    



{- Some string formatting -}


getFileName : String -> String
getFileName path =
    let
        fileName =
            String.split "/" path
                |> List.reverse
                |> List.head
                |> Maybe.withDefault path
    in
    fileName
        |> String.replace "." ""
        |> String.replace "-" ""
        |> String.replace "_" ""
        |> String.replace " " ""
        |> String.replace "/" ""
        |> String.replace "’" ""
        |> String.replace "'" ""
        |> decapitalize


decapitalize : String -> String
decapitalize str =
    case String.uncons str of
        Nothing ->
            str

        Just ( first, tail ) ->
            String.fromChar (Char.toLower first) ++ tail