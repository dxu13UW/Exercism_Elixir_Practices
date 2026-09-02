defmodule Sublist do
  @moduledoc """
  Exercism exercise - Sublist
  """

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b ->
        :equal

      length(a) < length(b) and sublist?(a, b) ->
        :sublist

      length(a) > length(b) and sublist?(b, a) ->
        :superlist

      true ->
        :unequal
    end
  end

  defp sublist?([], _b), do: true
  defp sublist?(_a, []), do: false

  defp sublist?(a, [_head | tail] = b) do
    List.starts_with?(b, a) or sublist?(a, tail)
  end
end
