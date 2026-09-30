defmodule LogParser do
  @moduledoc """
  Exercism exercise - Log parser  
  """

  def valid_line?(line) do
    tags = ["DEBUG", "INFO", "WARNING", "ERROR"]

    Enum.any?(tags, fn tag ->
      Regex.match?(~r/^\[#{tag}\]/, line)
    end)
  end

  def split_line(line) do
    pattern = ~r/<[~*=-]*>/

    Regex.split(pattern, line)
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&(&1 != ""))
  end

  def remove_artifacts(line) do
    pattern = ~r/end-of-line\d+/i

    String.replace(line, pattern, "")
  end

  def tag_with_user_name(line) do
    case Regex.run(~r/User\s+(\S+)/u, line) do
      [_, name] -> "[USER] #{name} #{line}"
      nil -> line
    end
  end
end
