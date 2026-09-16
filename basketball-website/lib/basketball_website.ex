defmodule BasketballWebsite do
  @moduledoc """
  Exercism exercise - Basketball website
  """
  def extract_from_path(data, path) do
    keys = String.split(path, ".")
    do_extract(data, keys)
  end

  defp do_extract(data, []), do: data
  defp do_extract(nil, _keys), do: nil
  defp do_extract(data, [head | tail]), do: do_extract(data[head], tail)

  def get_in_path(data, path) do
    keys = String.split(path, ".")
    get_in(data, keys)
  end
end
