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


fromValue : Value -> ( String, Property ) -> Elm.Declaration
fromValue value ( key, property ) =
    case value of
        Constant constant ->
            Elm.declaration (Name.fromValue value key)
                (Gen.Html.Attributes.call_.style (Elm.string key) (Elm.string constant))

        Unit unit ->
            Elm.declaration (Name.fromValue value key)
                (Elm.fn ( "value", Nothing )
                    (\float -> Gen.Html.Attributes.call_.style (Elm.string key) (Gen.String.call_.append (Gen.String.call_.fromFloat float) (Elm.string unit)))
                )


toDeclarations : { values : Dict String (List Value) } -> ( String, Property ) -> List Elm.Declaration
toDeclarations { values } ( key, property ) =
    let
        baseDeclaration =
            Elm.declaration (Name.normalize key)
                (Elm.fn ( "value", Nothing )
                    (\string ->
                        Gen.Html.Attributes.call_.style (Elm.string key) string
                    )
                )

        declarations =
            values
                |> Dict.get key
                |> Maybe.withDefault []
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
