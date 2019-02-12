defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence, ~r/[^[:alnum:]-]/u, trim: true)
    |> List.foldl(%{}, &count/2)
  end

  defp count(word, accum) do
    key = String.downcase(word)
    Map.update(accum, key, 1, &(&1 + 1))
  end
end
