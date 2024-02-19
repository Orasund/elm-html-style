module Property exposing (..)

import Config
import Dict exposing (Dict)
import Elm
import Elm.Declare
import Elm.ToString
import File.PropertiesJson exposing (Property)
import Gen.Html.Attributes
import Gen.String
import Name
import Syntax exposing (Value(..))


fromValue : { fn | call : Elm.Expression -> Elm.Expression } -> Value -> ( String, Property ) -> Elm.Declaration
fromValue fun value ( key, property ) =
    case value of
        Constant constant ->
            Elm.declaration (Name.fromValue value key)
                (fun.call (Elm.string constant))

        Unit unit ->
            Elm.declaration (Name.fromValue value key)
                (Elm.fn ( "value", Nothing )
                    (\float -> fun.call (Gen.String.call_.append (Gen.String.call_.fromFloat float) (Elm.string unit)))
                )


toDeclarations : { values : Dict String (List Value) } -> ( String, Property ) -> List Elm.Declaration
toDeclarations { values } ( key, property ) =
    let
        baseDeclaration =
            Elm.Declare.fn (Name.normalize key)
                ( "value", Nothing )
                (\string ->
                    Gen.Html.Attributes.call_.style (Elm.string key) string
                )

        declarations =
            values
                |> Dict.get key
                |> Maybe.withDefault []
                |> List.map
                    (\value ->
                        fromValue baseDeclaration value ( key, property )
                        |> Elm.withDocumentation (
                            (case value of
                                Constant constant -> 
                                    "```\n"
                                    ++ key ++ " : " ++ constant
                                    ++ "\n"
                                    ++ "```\n\n"
                                Unit unit ->
                                    "```\n"
                                    ++ key ++ " : 42" ++ unit
                                    ++ "\n"
                                    ++ "```\n\n")
                ++ (property.url |> Maybe.withDefault "")))
                    
                
            
    in
    declarations
        |> List.map
            (\declaration ->
                declaration
                    |> Elm.exposeWith
                        { exposeConstructor = False
                        , group = property.groups |> List.head
                        }
            )
        |> (::)
            (baseDeclaration.declaration
                |> Elm.withDocumentation
                    (("CSS property `" ++ key ++ "`\n\n") ++
                        (if Config.debug then
                        "Possible values: "
                            ++ property.syntax
                            ++ "\n\n"

                      else
                        "\n\n"
                     )++ ((property.url |> Maybe.withDefault ""))
                    )
                |> Elm.exposeWith
                    { exposeConstructor = False
                    , group = property.groups |> List.head
                    }
            )
