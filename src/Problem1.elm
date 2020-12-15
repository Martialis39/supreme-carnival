module Problem1 exposing (last, secondToLast, elementAt)

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
elementAt xs index =
  case xs of
    [a] -> Just a
    []  -> Maybe.Nothing
    _ -> List.drop index xs |> List.head

