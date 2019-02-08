-module(leap).

-export([leap_year/1]).

leap_year(Year) when is_integer(Year) ->
  if
    (Year rem 4 =:= 0) and (Year rem 100 =/= 0) -> true;
    (Year rem 4 =:= 0) and (Year rem 100 =:= 0) -> Year rem 400 =:= 0;
    true -> false
  end;
leap_year(_) -> "Year must be integer".
