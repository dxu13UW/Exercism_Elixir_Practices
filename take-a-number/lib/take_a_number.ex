defmodule TakeANumber do
  @moduledoc """
  Exercism exercise - Take a number
  """
  def start() do
    spawn(&loop/0)
  end

  defp loop(state \\ 0) do
    receive do
      {:report_state, sender} ->
        send(sender, state)
        loop(state)

      {:take_a_number, sender} ->
        new_state = state + 1
        send(sender, new_state)
        loop(new_state)

      :stop ->
        nil

      _ ->
        loop(state)
    end
  end
end
