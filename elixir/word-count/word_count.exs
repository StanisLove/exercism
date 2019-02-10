defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence, regex(), trim: true)
    |> List.foldl(%{}, &count/2)
  end

  defp regex do
    regexps = [
      # punctuation at the end of a word
      "(?<=\\w)\\p{P}(?!\\w)",
      # punctuation at the beginning of a word
      "(?<!\\w)\\p{P}(?=\\w)",
      # punctuation between not a letter chars
      "(?<!\\w)\\p{P}(?!\\w)",
      # symbols
      "\\p{S}",
      # underscores
      "_",
      # spaces
      "\\s"
    ]

    Enum.join(regexps, "|") |> Regex.compile!([:unicode])
  end

  defp count(word, accum) do
    key = String.downcase(word)
    Map.update(accum, key, 1, &(&1 + 1))
  end
end
