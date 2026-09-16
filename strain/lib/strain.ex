defmodule Strain do
  @moduledoc """
  Exercism exercise - strain
  """

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    do_keep(list, fun)
  end

  defp do_keep(list, fun, acc \\ [])
  defp do_keep([], _fun, acc), do: Enum.reverse(acc)

  defp do_keep([head | tail], fun, acc) do
    case fun.(head) do
      true -> do_keep(tail, fun, [head | acc])
      false -> do_keep(tail, fun, acc)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    do_discard(list, fun)
  end

  defp do_discard(list, fun, acc \\ [])
  defp do_discard([], _fun, acc), do: Enum.reverse(acc)

  defp do_discard([head | tail], fun, acc) do
    case fun.(head) do
      true -> do_discard(tail, fun, acc)
      false -> do_discard(tail, fun, [head | acc])
    end
  end
end
