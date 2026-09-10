defmodule ListOps do
  @moduledoc """
  Exercism exercise - List ops
  """

  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    do_count(l, 0)
  end

  defp do_count([], acc), do: acc

  defp do_count([_head | tail], acc) do
    do_count(tail, acc + 1)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverse(l, [])
  end

  defp do_reverse([], acc), do: acc

  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    do_map(l, f, [])
  end

  defp do_map([], _f, acc), do: reverse(acc)

  defp do_map([head | tail], f, acc) do
    if(f.(head)) do
      do_map(tail, f, [f.(head) | acc])
    else
      do_map(tail, f, acc)
    end
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    do_filter(l, f, [])
  end

  defp do_filter([], _f, acc), do: reverse(acc)

  defp do_filter([head | tail], f, acc) do
    if(f.(head)) do
      do_filter(tail, f, [head | acc])
    else
      do_filter(tail, f, acc)
    end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _f), do: acc

  def foldl([head | tail], acc, f) do
    foldl(tail, f.(head, acc), f)
  end

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr([], acc, _f), do: acc

  def foldr(l, acc, f) do
    reversed = reverse(l)
    foldl(reversed, acc, f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    do_append(a, b, [])
  end

  defp do_append([], [], acc), do: reverse(acc)

  defp do_append([], [head | tail], acc) do
    do_append([], tail, [head | acc])
  end

  defp do_append([head | tail], b, acc) do
    do_append(tail, b, [head | acc])
  end

  #  def append([], list2), do: list2

  #  def append([head | tail], list2) do
  #    [head | append(tail, list2)]
  #  end

  @spec concat([[any]]) :: [any]
  def concat(ll), do: do_concat(ll, [])

  defp do_concat([], acc), do: reverse(acc)

  defp do_concat([[] | rest], acc), do: do_concat(rest, acc)

  defp do_concat([[head | tail] | rest], acc) do
    do_concat([tail | rest], [head | acc])
  end
end
