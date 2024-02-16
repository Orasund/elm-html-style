module Property exposing (..)

import Json.Decode
import Dict exposing (Dict)
import Elm
import Gen.Html.Attributes

type alias Property = ()


toDeclaration : String -> Elm.Declaration
toDeclaration key =
       Elm.declaration (name key)
            (Elm.fn ("string",Nothing)
                (\string ->
                    Gen.Html.Attributes.call_.style (Elm.string key) string
                )
            )
    



{- Some string formatting -}


name : String -> String
name key =
    case key |> String.split "-" of 
        [] -> "error"
        head :: tail ->
            (head :: List.map capitalize tail |> String.concat)


capitalize : String -> String
capitalize str =
    case String.uncons str of
        Nothing ->
            str

        Just ( first, tail ) ->
            String.fromChar (Char.toUpper first) ++ tail