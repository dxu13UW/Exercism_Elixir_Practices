defmodule SquareRoot do
  @moduledoc """
  Exercism exercise - square root
  """

  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) when radicand > 0 do
    initial_guess = radicand / 2.0

    babylonian_iter(radicand, initial_guess)
    |> round()
  end

  defp babylonian_iter(radicand, prev_x) do
    next_x = 0.5 * (prev_x + radicand / prev_x)

    if abs(next_x - prev_x) < 1.0e-9 do
      next_x
    else
      babylonian_iter(radicand, next_x)
    end
  end
end
