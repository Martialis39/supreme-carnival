module Types exposing (Cell(..), Grid, Model, Msg(..))

type Cell
  = Player
  | Opponent
  | Empty

type alias Grid = List Cell


type alias Model =
    {
      board : Grid,
      gameStarted : Bool,
      winner : Cell,
      playerSide : Char,
      renderModal : Bool
    }

type Msg
    = SetCurrentText String
    | ChooseSide Char
    | UpdateBoard Int
    | MakeComputerMove
    | CheckForWin
