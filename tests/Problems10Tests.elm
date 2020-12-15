module Problems10Tests exposing (..)

import Test exposing (..)
import Expect
import Problem1 exposing (last, secondToLast, elementAt)


-- Check out https://package.elm-lang.org/packages/elm-explorations/test/latest to learn more about testing in Elm!


all : Test
all =
    describe "Problems 1 - 10 Test Suite"
        [ test "Empty list"  <|
            \_ ->
                Expect.equal (last []) Maybe.Nothing
        , test "List of numbers"  <|
            \_ ->
                Expect.equal (last [1,2,3]) (Just 3)
        , test "List of strings"  <|
            \_ ->
                Expect.equal (last ["a", "b", "c"]) (Just "c")
        , test "Second to last"  <|
            \_ ->
                Expect.equal (secondToLast ["a", "b", "c"]) (Just "b")
        , test "Second to last, with empty list"  <|
            \_ ->
                Expect.equal (secondToLast []) Maybe.Nothing
        , test "elementAt"  <|
            \_ ->
                Expect.equal (elementAt ["a"] 2) (Just "a")
        , test "elementAt, with empty list"  <|
            \_ ->
                Expect.equal (elementAt [] 0) Maybe.Nothing
        , test "elementAt, with proper input"  <|
            \_ ->
                Expect.equal (elementAt [1,2,3,4,5] 3) (Just 4)
        , test "elementAt, with inproper input"  <|
            \_ ->
                Expect.equal (elementAt [1,2] 3) Maybe.Nothing
        , test "elementAt, with negative index"  <|
            \_ ->
                Expect.equal (elementAt [1,2,3,4,5,5] -3) Maybe.Nothing
        ]
