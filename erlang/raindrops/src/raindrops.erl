-module(raindrops).

-export([convert/1]).

convert(Number) ->
  List = factors(Number),
  convert(Number, List).

convert(Number, []) -> integer_to_list(Number);
convert(_, List) ->
  F = fun(N,Acc) -> string:concat(Acc, num_to_drop(N)) end,
  lists:foldl(F, "", List).

factors(Number) ->
  [X || X <- lists:seq(2,Number),
        Number rem X == 0 andalso
        lists:member(X, [3,5,7])].

num_to_drop(3) -> "Pling";
num_to_drop(5) -> "Plang";
num_to_drop(7) -> "Plong";
num_to_drop(_) -> "".
