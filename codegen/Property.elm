module Property exposing (..)

import Elm
import Elm.ToString
import Gen.Basics
import Gen.Html.Attributes
import Gen.String
import Json.Decode
import Name
import Value exposing (Value(..))


type alias Property =
    { url : Maybe String
    , syntax : String
    , groups : List String
    }


decode : Json.Decode.Decoder Property
decode =
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


fromValue : Value -> ( String, Property ) -> Elm.Declaration
fromValue value ( key, property ) =
    case value of
        Constant constant ->
            Elm.declaration (Name.normalize key ++ Name.capitalize (Name.normalize constant))
                (Gen.Html.Attributes.call_.style (Elm.string key) (Elm.string constant))

        Unit unit ->
            Elm.declaration (Name.normalize key ++ Name.capitalize (Name.normalize unit))
                (Elm.fn ( "value", Nothing )
                    (\float -> Gen.Html.Attributes.call_.style (Elm.string key) (Gen.String.call_.append (Gen.String.call_.fromFloat float) (Elm.string unit)))
                )


toDeclarations : ( String, Property ) -> List Elm.Declaration
toDeclarations ( key, property ) =
    let
        baseDeclaration =
            Elm.declaration (Name.normalize key)
                (Elm.fn ( "value", Nothing )
                    (\string ->
                        Gen.Html.Attributes.call_.style (Elm.string key) string
                    )
                )

        declarations =
            property.syntax
                |> Value.constants
                |> List.map
                    (\value ->
                        fromValue value ( key, property )
                    )

        documentation args =
            "```\n"
                ++ args.body
                ++ "\n"
                ++ "```\n\n"
                ++ (property.url |> Maybe.withDefault "")
    in
    declarations
        |> List.map
            (\declaration ->
                declaration
                    |> Elm.withDocumentation
                        (documentation (Elm.ToString.declaration declaration))
                    |> Elm.exposeWith
                        { exposeConstructor = False
                        , group = property.groups |> List.head
                        }
            )
        |> (::)
            (baseDeclaration
                |> Elm.withDocumentation
                    --"Possible values: "
                    -- ++ property.syntax
                    --++ "\n\n"
                    --++
                    (documentation (Elm.ToString.declaration baseDeclaration))
                |> Elm.exposeWith
                    { exposeConstructor = False
                    , group = property.groups |> List.head
                    }
            )
