defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      yell?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      yell?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      empty?(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp yell?(input), do: input =~ ~r/\p{Lu}/u && !(input =~ ~r/\p{Ll}/u)
  defp question?(input), do: input =~ ~r/\?$/
  defp empty?(input), do: input =~ ~r/^\s*$/
end
