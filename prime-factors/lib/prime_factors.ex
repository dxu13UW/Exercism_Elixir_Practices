defmodule PrimeFactors do
  @moduledoc """
  Exercism exercise - Prime factors
  """

  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) when number > 0 do
    do_factors_for(number, 2, [])
  end

  defp do_factors_for(1, _divisor, factors), do: Enum.reverse(factors)

  defp do_factors_for(number, divisor, factors) when divisor * divisor > number do
    Enum.reverse([number | factors])
  end

  defp do_factors_for(number, divisor, factors) when rem(number, divisor) == 0 do
    do_factors_for(div(number, divisor), divisor, [divisor | factors])
  end

  defp do_factors_for(number, divisor, factors) do
    do_factors_for(number, divisor + 1, factors)
  end
end
