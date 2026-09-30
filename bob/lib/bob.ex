defmodule Bob do
  @moduledoc """
  Exercism exercise - Bob
  """

  @spec hey(String.t()) :: String.t()
  def hey(input) do
    case String.trim(input) do
      "" ->
        "Fine. Be that way!"

      trimmed ->
        case {shouting?(trimmed), question?(trimmed)} do
          {true, true} -> "Calm down, I know what I'm doing!"
          {true, false} -> "Whoa, chill out!"
          {false, true} -> "Sure."
          {false, false} -> "Whatever."
        end
    end
  end

  defp question?(str), do: String.ends_with?(str, "?")

  defp shouting?(str) do
    String.upcase(str) == str and String.downcase(str) != str
  end
end
