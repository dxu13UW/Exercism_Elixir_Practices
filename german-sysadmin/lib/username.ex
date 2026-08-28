defmodule Username do
  @moduledoc """
    Exercism exercise - German Sysadmin
  """

  @doc """
  Converts German usernames into English usernames
  - keeps all lowercase English letters
  - keeps underscores
  - converts a few German letters into English letters
  """
def sanitize(username), do: do_sanitize(username, [])

  defp do_sanitize([], acc), do: Enum.reverse(acc)

  defp do_sanitize([head | rest], acc) do
    case head do
      c when c in ?a..?z -> do_sanitize(rest, [c | acc])
      ?_                 -> do_sanitize(rest, [?_ | acc])
      ?ä                 -> do_sanitize(rest, ~c"ea" ++ acc) 
      ?ö                 -> do_sanitize(rest, ~c"eo" ++ acc)
      ?ü                 -> do_sanitize(rest, ~c"eu" ++ acc)
      ?ß                 -> do_sanitize(rest, ~c"ss" ++ acc)
      _                  -> do_sanitize(rest, acc)
    end
  end
end
