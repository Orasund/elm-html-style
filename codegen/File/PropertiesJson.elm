module File.PropertiesJson exposing (..)

import Dict exposing (Dict)
import Json.Decode


type alias Property =
    { url : Maybe String
    , syntax : String
    , groups : List String
    }


fileDecoder : Json.Decode.Decoder (Dict String Property)
fileDecoder =
    propertyDecoder
        |> Json.Decode.dict


propertyDecoder : Json.Decode.Decoder Property
propertyDecoder =
    Json.Decode.map3
        (\url syntax groups ->
            { url = url
            , syntax = syntax
            , groups = groups
            }
        )
        (Json.Decode.maybe
            (Json.Decode.field "mdn_url" Json.Decode.string)
        )
        (Json.Decode.field "syntax" Json.Decode.string)
        (Json.Decode.field "groups" (Json.Decode.list Json.Decode.string))
