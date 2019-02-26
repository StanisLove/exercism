-module(raindrops).

-export([convert/1]).

convert(Number) ->
  List = factors(Number),
  convert(Number, List).

convert(Number, []) -> integer_to_list(Number);
convert(_, List) ->
  Drops = lists:map(fun(N) -> num_to_drop(N) end, List),
  lists:flatten(Drops).

factors(Number) ->
  [X || X <- lists:seq(3,7,2), Number rem X == 0].

num_to_drop(3) -> "Pling";
num_to_drop(5) -> "Plang";
num_to_drop(7) -> "Plong";
num_to_drop(_) -> "".
