module Property exposing (..)

import Json.Decode

type alias Property ()

decode : Json.Decode.Decoder (Dict String Property )
decode =
    Json.Decode.dict File
        (Json.Decode.field "path" Json.Decode.string)
        (Json.Decode.field "contents" Json.Decode.string)
