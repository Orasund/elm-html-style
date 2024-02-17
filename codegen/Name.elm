module Name exposing (..)


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
