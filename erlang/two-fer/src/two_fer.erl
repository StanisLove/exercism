-module(two_fer).

-export([two_fer/0, two_fer/1]).

-define(STR, "One for you, one for me.").


two_fer() -> ?STR.

two_fer(Name) -> string:replace(?STR, "you", Name).
