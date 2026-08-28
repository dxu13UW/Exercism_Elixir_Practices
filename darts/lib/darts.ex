defmodule Darts do
  @moduledoc """
  Exercism exercice - Darts
  """
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance = get_distance({x, y})

    cond do
      distance <= 1 ->
        10

      distance <= 5 ->
        5

      distance <= 10 ->
        1

      true ->
        0
    end
  end

  defp get_distance({x, y}), do: :math.sqrt(x ** 2 + y ** 2)
end
