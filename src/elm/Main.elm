port module Main exposing (..)

import Platform exposing (Program)

port sourceFileUpdate: ((String,String) -> msg) -> Sub msg
port output : (List (String, String)) -> Cmd msg

main: Program Flags Model Msg
main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }

type alias JobName = String

type alias Model = 
    { jobName: Maybe JobName
    , sources: List SourceFile
    }

type alias SourceFile =
    { path: String
    , code: String
    }

type Msg
    = SourceCodeReceived (String, String)

type alias Flags = JobName

emptyModel : Model
emptyModel = { jobName = Nothing,  sources = [] }

init : Flags -> (Model, Cmd Msg)
init _ =
    let
        model = { emptyModel | jobName = Just "test"}
    in
    
    (model, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        SourceCodeReceived (path, code) ->
            let 
                sourceFile = { path = path, code = code }
                newModel = { model | sources = sourceFile :: model.sources }
            in
                (newModel, (send newModel))

subscriptions : Model -> Sub Msg
subscriptions _ =
    sourceFileUpdate SourceCodeReceived

send: Model -> Cmd Msg
send model =
    output (List.map (\sourceFile -> (sourceFile.path, sourceFile.code)) model.sources)