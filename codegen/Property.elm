module Property exposing (..)

import Config
import Dict exposing (Dict)
import Elm
import Elm.ToString
import File.PropertiesJson exposing (Property)
import Gen.Html.Attributes
import Gen.String
import Name
import Syntax exposing (Value(..))
import Value


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


toDeclarations : Dict String (List Value) -> ( String, Property ) -> List Elm.Declaration
toDeclarations syntaxGroups ( key, property ) =
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
                |> Value.parse syntaxGroups
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
                    ((if Config.debug then
                        "Possible values: "
                            ++ property.syntax
                            ++ "\n\n"

                      else
                        ""
                     )
                        ++ documentation (Elm.ToString.declaration baseDeclaration)
                    )
                |> Elm.exposeWith
                    { exposeConstructor = False
                    , group = property.groups |> List.head
                    }
            )
