-module(raindrops).

-export([convert/1]).

convert(Number) ->
  List = factors(Number),
  convert(Number, List).

convert(Number, []) -> integer_to_list(Number);
convert(_, Drops) -> lists:flatten(Drops).

factors(Number) ->
  [num_to_drop(X) || X <- [3,5,7], Number rem X == 0].

num_to_drop(3) -> "Pling";
num_to_drop(5) -> "Plang";
num_to_drop(7) -> "Plong".
