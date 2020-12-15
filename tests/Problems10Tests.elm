module Problems10Tests exposing (..)

import Test exposing (..)
import Expect
import Problem1 exposing (last, secondToLast, elementAt, countElements, myReverse)


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
                Expect.equal (elementAt ["a"] 2) Maybe.Nothing
        , test "elementAt, with empty list"  <|
            \_ ->
                Expect.equal (elementAt [] 0) Maybe.Nothing
        , test "elementAt, with proper input"  <|
            \_ ->
                Expect.equal (elementAt [1,2,3,4,5] 3) (Just 3)
        , test "elementAt, with inproper input"  <|
            \_ ->
                Expect.equal (elementAt [1,2] 3) Maybe.Nothing
        , test "elementAt, with negative index"  <|
            \_ ->
                Expect.equal (elementAt [1,2,3,4,5,5] -3) Maybe.Nothing
        , test "countElements 1" <|
            \_ ->
                Expect.equal(countElements (List.range 1 4000))  4000
        , test "countElements 2" <|
            \_ ->
                Expect.equal(countElements [ 1 ])  1
        , test "countElements 3" <|
            \_ ->
                Expect.equal(countElements [])  0
        , test "countElements 4" <|
            \_ ->
                Expect.equal(countElements [ 'a', 'b', 'c' ])  3
        , test "myReverse" <|
            \_ ->
                Expect.equal(myReverse [1, 2, 3, 4]) [4, 3, 2, 1]
        , test "myReverse 1" <|
            \_ ->
                Expect.equal(myReverse [2, 1]) [1, 2]
        , test "myReverse 2" <|
            \_ ->
                Expect.equal(myReverse [1]) [1]
        , test "myReverse 3" <|
            \_ ->
                Expect.equal(myReverse []) []
        , test "myReverse 4" <|
            \_ ->
                Expect.equal(myReverse [ 'a', 'b', 'c' ]) [ 'c', 'b', 'a' ]
        ]
