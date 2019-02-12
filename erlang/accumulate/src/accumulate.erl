-module(accumulate).

-export([accumulate/2]).

accumulate(Fn, Ls) -> accumulate([], Fn, Ls).

accumulate(Acc, Fn, [H|T]) -> accumulate([Fn(H)|Acc], Fn, T);
accumulate(Acc, _, []) -> lists:reverse(Acc).
