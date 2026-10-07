# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  @moduledoc """
  Exercism exercise - Community garden
  """

  def start(opts \\ []) do
    {:ok, _pid} = Agent.start(fn -> %{plot: [], next_id: 1} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn %{plots: plots} -> plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plot: plots, next_id: id} = state ->
      plot = %Plot{plot_id: id, registered_to: register_to}
      {plot, %{state | plots: [plot | plots], next_id: id + 1}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn %{plots: plots} = state ->
      %{state | plots: Enum.reject(plots, &(&1.plot_id == plot_id))}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn %{plots: plots} ->
      Enum.find(plots, {:not_found, "plot is unregistered"}, &(&1.plot_id == plot_id))
    end)
  end
end
