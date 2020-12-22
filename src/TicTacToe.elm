module TicTacToe exposing (Cell(..), Grid, makeMove, makeComputerMove, checkForWinningState, readSquare, checkForWin)
import Array exposing (Array)

type Cell
  = Player
  | Opponent
  | Empty

type alias Grid = List Cell

setElementAt : a -> Int -> List a -> List a
setElementAt element index list =
  List.take index list ++ [element] ++ List.drop (index + 1) list


getElementAt : Int -> List a -> Maybe a
getElementAt n list =
    case list of
        [] ->
            Nothing

        x :: xs ->
            if n == 0 then
                Just x
            else
                getElementAt (n - 1) xs

indexOf : a -> List a -> Int -> Int
indexOf element board offset =
  case board of
    [] ->
        -1
    x::xs ->
      if x == element then
        offset
      else
        indexOf element xs (offset + 1)



readSquare : Int -> Grid -> Cell
readSquare index =
    getElementAt index >> Maybe.withDefault Empty

makeMove : Int -> Cell -> Grid -> Grid
makeMove index player board =
  setElementAt player index board

makeComputerMove : Int -> Cell -> Grid -> Grid
makeComputerMove index computer board =
  let
      firstAvailableSquare = indexOf Empty board 0
  in
    makeMove firstAvailableSquare computer board


type alias WinningCombination = List Int

winningCombinations : List (List Int)
winningCombinations =
  [
    [1,2,3],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

checkForWinningState : List Int -> Cell -> Grid -> Bool
checkForWinningState combination side board =
  List.all (\index -> (readSquare index board) == side ) combination

checkForWin : List (List Int) -> Cell -> Grid -> Bool
checkForWin allWinningCombinations side board =
  List.any (\combination -> checkForWinningState combination side board) allWinningCombinations
