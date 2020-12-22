module TicTacToeTests exposing (..)

import Test exposing (..)
import Expect
import TicTacToe exposing (Cell(..), makeMove, makeComputerMove, checkForWinningState, readSquare, checkForWin)
import Array
import Array exposing (Array)


-- Check out https://package.elm-lang.org/packages/elm-explorations/test/latest to learn more about testing in Elm!


all : Test
all =
    describe "Tic tac toe"
        [
          describe "makeMove"
          [
            test "it sets the index to the cell" <|
            \_ ->
              let
                  newBoard = makeMove 0 Player ( [Opponent, Player, Player])
              in

              Expect.equal newBoard ( [Player, Player, Player])
          ]
          , describe "makeComputerMove"
          [
            test "it sets the index to the cell" <|
            \_ ->
              let
                  newBoard = makeComputerMove 0 Opponent ( [Opponent, Player, Empty])
              in

              Expect.equal newBoard ( [Opponent, Player, Opponent])
          ]
          , describe "checkForWinningState"
          [
            test "returns true when the combination is valid" <|
            \_ ->
              let
                  board = [Player, Player, Player]
              in

              Expect.equal (checkForWinningState [0,1,2] Player board) True
              , test "returns false when the combination is invalid" <|
            \_ ->
              let
                  board = [Player, Opponent, Player]
              in

              Expect.equal (checkForWinningState [0,1,2] Player board) False
              , test "returns true when the combination is valid and side is Opponent" <|
            \_ ->
              let
                  board = [Opponent, Opponent, Opponent]
              in

              Expect.equal (checkForWinningState [0,1,2] Opponent board) True
          ]
          , describe "readSquare"
          [
            test "returns the square" <|
            \_ ->
              Expect.equal (readSquare 2 ( [Player, Player, Opponent])) Opponent
            , test "returns Empty when index is out of range" <|
            \_ ->
              Expect.equal (readSquare 5 ( [Player, Player, Opponent])) Empty
          ]
          , describe "checkForWin"
          [
            test "returns true when any combination is valid" <|
            \_ ->
              let
                  winningCombinations =
                    [
                      [0,1,2],
                      [3,4,5]
                    ]
                  board = [Opponent, Opponent, Player, Player, Player, Player]
              in

              Expect.equal (checkForWin winningCombinations Player board) True
          ]

        ]

