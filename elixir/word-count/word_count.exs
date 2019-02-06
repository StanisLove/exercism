defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    regex = ~r/(?<=\w)\p{P}(?!\w)|(?<!\w)\p{P}(?=\w)|(?<!\w)\p{P}(?!\w)|\p{S}|_/u

    String.replace(sentence, regex, " ")
    |> String.split
    |> List.foldl(%{}, fn word, accum -> count(word, accum) end)
  end

  defp count(word, accum) do
    key = String.downcase(word)
    value = accum[key]
    count(key, value, accum)
  end

  defp count(key, nil, accum), do: Map.put(accum, key, 1)
  defp count(key, value, accum), do: Map.put(accum, key, value + 1)
end
