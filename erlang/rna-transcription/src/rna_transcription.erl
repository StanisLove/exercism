-module(rna_transcription).

-export([to_rna/1]).


to_rna(Strand) ->
  [char_to_rna([Char]) || Char <- Strand].

char_to_rna("G") -> [Char] = "C", Char;
char_to_rna("C") -> [Char] = "G", Char;
char_to_rna("T") -> [Char] = "A", Char;
char_to_rna("A") -> [Char] = "U", Char.
