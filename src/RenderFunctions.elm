module RenderFunctions exposing (renderBoard, renderSquare, renderSideChoice, renderWinner)
import Types exposing (Cell(..), Grid, Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

renderWinner : Model -> Html Msg
renderWinner model =
  text (if model.winner == Player
      then "Player won"
    else if model.winner == Opponent
      then "Opponent won"
    else
      "")


renderSideChoice : Model -> Html Msg
renderSideChoice model =
  div
    [
      id "buttons"
    ]
    (
      if model.playerSide == ' ' then
      [
          button
          [
            onClick (ChooseSide 'X')
          ]
          [
            text "X"
          ]
          , button
          [
            onClick (ChooseSide 'O')
          ]
          [
            text "O"
          ]
        ]
        else
        []
    )


renderBoard : Model -> Html Msg
renderBoard model =
  div
    [
      id "board"
    ]
    (List.indexedMap (renderSquare model) model.board)

renderSquare : Model -> Int -> Cell -> Html Msg
renderSquare model index cell =
  let
      symbol = case cell of
        Player ->
          model.playerSide
        Opponent ->
          if model.playerSide == 'X' then 'O' else 'X'
        _ ->
          ' '
  in

  div [
        class "cell",
        onClick (UpdateBoard index)
      ]
      [
       text (String.fromChar symbol)
      ]
