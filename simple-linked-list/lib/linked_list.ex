defmodule LinkedList do
  @moduledoc """
  Exercism exercise - Simple linked list
  """

  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    {elem, list}
  end

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count(list) do
    do_count(list, 0)
  end

  defp do_count({}, acc), do: acc

  defp do_count({_elem, tail}, acc), do: do_count(tail, acc + 1)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?({}), do: true
  def empty?(_list), do: false

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({}), do: {:error, :empty_list}
  def peek({first, _tail}), do: {:ok, first}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({}), do: {:error, :empty_list}
  def tail({head}), do: {:ok, head}
  def tail({_head, tail}), do: tail({tail})

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({}), do: {:error, :empty_list}
  def pop({head, tail}), do: {:ok, head, tail}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list([]), do: {}
  def from_list([head | tail]), do: {head, from_list(tail)}

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list({}), do: []
  def to_list({head, tail}), do: [head | to_list(tail)]

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse({}), do: {}

  def reverse(list) do
    do_reverse(list, new())
  end

  defp do_reverse({}, acc), do: acc
  defp do_reverse({head, tail}, acc), do: do_reverse(tail, push(acc, head))
end
