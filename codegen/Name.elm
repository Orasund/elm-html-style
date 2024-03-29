module Name exposing (..)

import Syntax exposing (Value(..))

fromValue : Value -> String -> String
fromValue value base =
    case (base,value) of
        ("white-space", Constant "collapse") ->
            normalize base ++ "_collapse"
        ("scroll-snap-type",Constant "x") ->
            normalize base ++ "_x"
        ("scroll-snap-type",Constant "y") ->
            normalize base ++ "_y"   
        ( "border-image", Constant "repeat") ->
            normalize base ++ "_repeat"
        ( "font-synthesis", Constant "position") ->
            normalize base ++ "_position"
        ( "font-synthesis", Constant "small-caps") ->
            normalize base ++ "_smallCaps"
        ( "font-synthesis", Constant "style") ->
            normalize base ++ "_style"
        ( "font-synthesis", Constant "weight") ->
            normalize base ++ "_weight"
        ( "mask-border", Constant "repeat") ->
            normalize base ++ "_repeat"
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
