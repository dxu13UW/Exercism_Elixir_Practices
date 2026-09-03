defmodule LibraryFees do
  @moduledoc """
  Exercism exercise - Library fees
  """
  def datetime_from_string(string) do
    case NaiveDateTime.from_iso8601(string) do
      {:ok, naive_datetime} -> naive_datetime
      {:error, reason} -> {:error, reason}
    end
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.before?(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    # if before_noon?(checkout_datetime) do
    #   NaiveDateTime.to_date(checkout_datetime)
    #   |> Date.add(28)
    # else
    #   NaiveDateTime.to_date(checkout_datetime)
    #   |> Date.add(29)
    # end

    days = if before_noon?(checkout_datetime), do: 28, else: 29

    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(days)
  end

  @spec days_late(Date.t(), NaiveDateTime.t()) :: non_neg_integer()
  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)

    case Date.diff(actual_return_date, planned_return_date) do
      diff when diff > 0 -> diff
      _ -> 0
    end
  end

  def monday?(naive_datetime) do
    naive_datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week() == 1
  end

  @spec calculate_late_fee(String.t(), String.t(), number()) :: integer()
  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    actual_return_datetime = datetime_from_string(return)

    planned_date = return_date(checkout_datetime)
    late_days = days_late(planned_date, actual_return_datetime)

    fee = late_days * rate

    if monday?(actual_return_datetime) do
      floor(fee * 0.5)
    else
      floor(fee)
    end
  end
end
