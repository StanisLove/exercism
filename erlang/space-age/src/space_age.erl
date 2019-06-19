-module(space_age).
-export([age/2]).
-define(Periods, #{mercury => 0.2408467,
                   venus => 0.61519726,
                   mars => 1.8808158,
                   jupiter => 11.862615,
                   saturn => 29.447498,
                   uranus => 84.016846,
                   neptune => 164.79132}).


age(earth, Seconds) -> Seconds / 31557600;
age(Planet, Seconds) -> age(earth, Seconds) / maps:get(Planet, ?Periods).
