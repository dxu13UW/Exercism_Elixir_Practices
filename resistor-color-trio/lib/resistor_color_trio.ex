defmodule ResistorColorTrio do
  @moduledoc """
  Exercism exercise - Resistor color trio
  """

  @color_integer %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([first, second, third | _rest]) do
    base = @color_integer[first] * 10 + @color_integer[second]
    zeros = Integer.pow(10, @color_integer[third])
    total_ohms = base * zeros

    cond do
      total_ohms >= 1_000_000_000 and rem(total_ohms, 1_000_000_000) == 0 ->
        {div(total_ohms, 1_000_000_000), :gigaohms}

      total_ohms >= 1_000_000 and rem(total_ohms, 1_000_000) == 0 ->
        {div(total_ohms, 1_000_000), :megaohms}

      total_ohms >= 1_000 and rem(total_ohms, 1_000) == 0 ->
        {div(total_ohms, 1_000), :kiloohms}

      true ->
        {total_ohms, :ohms}
    end
  end
end
