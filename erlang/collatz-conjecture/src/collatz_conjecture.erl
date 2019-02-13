-module(collatz_conjecture).

-export([steps/1]).

steps(N) when N =< 0 -> {error, "Only positive numbers are allowed"};
steps(N) -> steps(N, 0).

steps(1, Step) -> Step;
steps(N, Step) when N rem 2 =:= 0 -> steps(N div 2, Step + 1);
steps(N, Step) -> steps(N * 3 + 1, Step + 1).
