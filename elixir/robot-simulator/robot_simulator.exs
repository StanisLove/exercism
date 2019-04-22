defmodule RobotSimulator do

  @directions [:north, :east, :south, :west]

  @invalid_position {:error, "invalid position"}
  @invalid_direction {:error, "invalid direction"}

  defstruct direction: :north, position: {0,0}

  defguard is_direction(direction) when direction in @directions

  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(), do: %RobotSimulator{}
  def create(direction, {x,y})
    when is_direction(direction) and
    is_integer(x) and
    is_integer(y),
    do: %RobotSimulator{direction: direction, position: {x,y}}
  def create(direction, _) when not is_direction(direction),
    do: @invalid_direction
  def create(_, _), do: @invalid_position

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    charlist = String.to_charlist(instructions)
    if Enum.all?(charlist, fn(char) -> char in 'RLA' end) do
      List.foldl(charlist, robot, &execute/2)
    else
      {:error, "invalid instruction"}
    end
  end

  defp execute(?A, robot) do
    %{robot | position: new_position(robot.direction, robot.position)}
  end
  defp execute(turn, robot) do
    index = Enum.find_index(@directions, fn x -> x == robot.direction end)
    %{robot | direction: new_direction(index, turn)}
  end

  defp new_position(:north, {x,y}), do: {x,y+1}
  defp new_position(:east, {x,y}), do: {x+1,y}
  defp new_position(:south, {x,y}), do: {x,y-1}
  defp new_position(:west, {x,y}), do: {x-1,y}

  defp new_direction(index, ?R), do: Enum.at(@directions, index - 3)
  defp new_direction(index, ?L), do: Enum.at(@directions, index - 1)

  @spec direction(robot :: any) :: atom
  def direction(%RobotSimulator{direction: direction}), do: direction

  @spec position(robot :: any) :: {integer, integer}
  def position(%RobotSimulator{position: position}), do: position
end
