module File.SyntaxesJson exposing (..)

import Dict exposing (Dict)
import Json.Decode


fileDecoder : Json.Decode.Decoder (Dict String String)
fileDecoder =
    Json.Decode.field "syntax" Json.Decode.string
        |> Json.Decode.dict
