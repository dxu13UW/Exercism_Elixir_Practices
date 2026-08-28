defmodule EliudsEggs do
  @moduledoc """
  Exercism exercise - Eliud's Eggs
  """
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    count_eggs(number, 0)
  end

  defp count_eggs(0, acc), do: acc

  defp count_eggs(number, acc) do
    count_eggs(div(number, 2), acc + rem(number, 2))
  end
end
