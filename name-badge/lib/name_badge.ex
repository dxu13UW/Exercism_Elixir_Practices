defmodule NameBadge do
  @moduledoc """
  Exercism exercise - Name badge
  """

  @doc """
  Prints a formatted string of an employee.
  """
  @spec print(id :: String.t(), name :: String.t(), department :: String.t()) :: String.t()
  def print(id, name, department) do
    dept = if department, do: String.upcase(department), else: "OWNER"
    prefix = if id, do: "[#{id}] - ", else: ""

    "#{prefix}#{name} - #{dept}"
  end
end
