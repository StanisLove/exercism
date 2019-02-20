defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    Integer.digits(number)
    |> numerals([])
  end

  defp numerals([], acc), do: to_string(acc)
  defp numerals([head | tail], acc) do
    digit_num = length(tail) + 1
    roman = char_to_roman(head, digit_num)
    numerals(tail, acc ++ roman)
  end

  defp char_to_roman(0, _), do: ''
  defp char_to_roman(digit, digit_num) when digit >= 1 and digit <= 3 do
    char = one(digit_num)
    replicate(digit, char)
  end
  defp char_to_roman(4, digit_num) do
    [one(digit_num), five(digit_num)]
  end
  defp char_to_roman(5, digit_num), do: [five(digit_num)]
  defp char_to_roman(digit, digit_num) when digit >= 6 and digit <= 8 do
    char = one(digit_num)
    [five(digit_num) | replicate(digit - 5, char)]
  end
  defp char_to_roman(9, digit_num) do
    [one(digit_num), one(digit_num + 1)]
  end

  defp one(1), do: ?I
  defp one(2), do: ?X
  defp one(3), do: ?C
  defp one(4), do: ?M

  defp five(1), do: ?V
  defp five(2), do: ?L
  defp five(3), do: ?D

  defp replicate(n, x), do: for _ <- 1..n, do: x
end
