defmodule Bob do
  @type input() :: String.t()

  @spec hey(input()) :: String.t()
  def hey(input) do
    cond do
      true -> raise "Your implementation goes here"
    end
  end
end
