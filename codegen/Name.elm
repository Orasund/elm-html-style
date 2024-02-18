module Name exposing (..)

import Syntax exposing (Value(..))

fromValue : Value -> String -> String
fromValue value base =
    case (base,value) of
        ("white-space", Constant "collapse") ->
            normalize base ++ "_collapse"
        ("scroll-snap-type",Constant "x") ->
            normalize base ++ "_x"
        _ ->
            case value of
                Constant constant ->
                    
                    normalize base ++ capitalize (normalize constant)

                Unit unit ->
                    normalize base ++ capitalize (normalize unit)

normalize : String -> String
normalize key =
    case key |> String.split "-" of
        [] ->
            "error"

        head :: tail ->
            head :: List.map capitalize tail |> String.concat


capitalize : String -> String
capitalize str =
    case String.uncons str of
        Nothing ->
            str

        Just ( first, tail ) ->
            String.fromChar (Char.toUpper first) ++ tail
