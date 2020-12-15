module Problem1 exposing (last, secondToLast, elementAt, countElements)

last : List a -> Maybe a
last xs =
  case xs of
    [head] -> Just head
    head::tail ->
      last tail
    _ -> Maybe.Nothing

secondToLast : List a -> Maybe a
secondToLast xs =
  case xs of
    [secondToLastElement, lastElement] -> Just secondToLastElement
    head::tail ->
      secondToLast tail
    _ -> Maybe.Nothing


elementAt : List a -> Int -> Maybe a
elementAt list n =
    case list of
        [] ->
            Nothing

        x :: xs ->
            if n == 1 then
                Just x
            else
                elementAt xs (n - 1)

countElements : List a -> Int
countElements xs = List.foldl (\_ acc -> acc + 1) 0 xs
