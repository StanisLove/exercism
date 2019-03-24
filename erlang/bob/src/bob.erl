-module(bob).

-export([response/1]).

% You may want to use proplist:get_value/2 to implement the logic in lines 10-14.
% This would make the logic agnostic to the order in which the three tuples appear
% in the proplist.
% However, since that is unlikely to ever change, you might find your current
% approach preferable.
%
% An additional suggestion to simplify question/1 and empty/1 is to trim the String
% before passing it into any other function.

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
