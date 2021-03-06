module TicTacToe exposing (..)
import Array exposing (Array)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
--
import Utility exposing (..)
import Types exposing (Cell(..), Grid, Model, Msg(..))
import RenderFunctions exposing (..)

-- MAIN

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }

-- MODEL

init : Model
init =
    {
      board = [Empty, Empty, Empty, Empty, Empty, Empty, Empty, Empty, Empty],
      gameStarted = False,
      winner = Empty,
      playerSide = ' ',
      renderModal = False
    }


-- Call update recursively to chain actions
update : Msg -> Model -> Model
update msg model =
    case msg of
        ChooseSide symbol ->
          { model | playerSide = symbol }
        UpdateBoard index ->
          let
              updatedBoard = setElementAt Player index model.board
          in
          update MakeComputerMove { model | board = updatedBoard}

        CheckForWin ->
          let
              winner = checkForWin Player model.board
              showModal = if winner == Empty then False else True
          in
          {model | winner = winner, renderModal = showModal }

        MakeComputerMove ->
          let
              updatedBoard = makeComputerMove Opponent model.board
          in
          update CheckForWin { model | board = updatedBoard}
        a ->
          model



-- VIEW

view : Model -> Html Msg
view model =
    div
        []
        [ node "link"
            [ rel "stylesheet"
            , href "stylesheets/main.css"
            ]
            []
        , renderModal model
        , section
            [ class "container" ]
            [
              h1 [
                class "title"
              ]
              [
                text "Tic-Tac-Toe"
              ]
              , renderSideChoice model
              , renderBoard model
            ]
        ]


