-module(hamming).

-export([distance/2]).


distance(Strand1, Strand2) when length(Strand1) =/= length(Strand2) ->
  {error,"left and right strands must be of equal length"};
distance(Strand1, Strand2) ->
  lists:foldl(
    fun(Cells, Sum) -> distance(Cells) + Sum end,
    0, lists:zip(Strand1, Strand2)
  ).

distance({X,X}) -> 0;
distance(_) -> 1.
