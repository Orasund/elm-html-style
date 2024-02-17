module Property exposing (..)

import Elm
import Elm.ToString
import Gen.Html.Attributes
import Json.Decode
import Name
import Value


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


toDeclarations : ( String, Property ) -> List Elm.Declaration
toDeclarations ( key, property ) =
    let
        baseDeclaration =
            Elm.declaration (Name.normalize key)
                (Elm.fn ( "string", Nothing )
                    (\string ->
                        Gen.Html.Attributes.call_.style (Elm.string key) string
                    )
                )

        declarations =
            property.syntax
                |> Value.constants
                |> List.map
                    (\value ->
                        Elm.declaration (Name.normalize key ++ Name.capitalize (Name.normalize value))
                            (Gen.Html.Attributes.call_.style (Elm.string key) (Elm.string value))
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
