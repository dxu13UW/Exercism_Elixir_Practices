defmodule WeightConverter do
  @moduledoc """
    Practice problem generated from GAI
  """
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :moon
          | :mars
          | :jupiter
          | :sun

  @earth_gravity 9.80665

  @relative_gravity %{
    mercury: 0.378,
    venus: 0.907,
    earth: 1.0,
    moon: 0.166,
    mars: 0.77,
    jupiter: 2.528,
    sun: 27.01
  }

  @doc """
  Calculates the gravitational force (in Newtons) on a given body for a specified mass in kg.
  Formula: Force (N) = mass * earth_gravity * relative_gravity

  Returns:
  - `{:ok, force}` if the body is valid
  - `{:error, "invalid celestial body"}` if the atom is unrecognized
  """
  @spec weight_on(planet, number) :: {:ok, float} | {:error, String.t()}
  def weight_on(planet, mass) when mass >= 0 do
    case Map.fetch(@relative_gravity, planet) do
      {:ok, ratio} ->
        {:ok, mass * @earth_gravity * ratio}

      :error ->
        {:error, "not a planet"}
    end
  end
end
