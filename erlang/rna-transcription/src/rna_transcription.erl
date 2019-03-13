-module(rna_transcription).

-export([to_rna/1]).


to_rna(Strand) ->
  [char_to_rna(Char) || Char <- Strand].

char_to_rna($G) -> $C;
char_to_rna($C) -> $G;
char_to_rna($T) -> $A;
char_to_rna($A) -> $U.
