-module(bob).

-export([response/1]).

response(String) ->
  case [{question, question(String)},
        {yell, yell(String)},
        {empty, empty(String)}] of

    [{question, true}, {yell, false}, _] -> "Sure.";
    [{question, true}, {yell, true}, _] -> "Calm down, I know what I'm doing!";
    [{question, false}, {yell, true}, _] -> "Whoa, chill out!";
    [_, _, {empty, true}] -> "Fine. Be that way!";
    [_, _, _] -> "Whatever."
  end.

question(String) -> match(String, "\\?\\s*$").

yell(String) ->
  match(String, "[[:alpha:]]") andalso not match(String, "[[:lower:]]").

empty(String) -> not match(String, "\\w").

match(String, Regex) ->
  case re:run(String, Regex) of
    nomatch -> false;
    _ -> true
  end.
