defmodule DNA do
  @moduledoc """
  Exercism exercise - DNA encoding
  """

  def encode_nucleotide(?\s), do: 0b0000
  def encode_nucleotide(?A), do: 0b0001
  def encode_nucleotide(?C), do: 0b0010
  def encode_nucleotide(?G), do: 0b0100
  def encode_nucleotide(?T), do: 0b1000

  def decode_nucleotide(0b0000), do: ?\s
  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T

  def encode(charlist), do: do_encode(charlist, <<>>)

  defp do_encode([], bitstring), do: bitstring

  defp do_encode([head | tail], bitstring) do
    encoded = encode_nucleotide(head)
    do_encode(tail, <<bitstring::bitstring, encoded::4>>)
  end

  # def decode(bitstring), do: do_decode(bitstring, ~c"")
  #
  # defp do_decode(<<>>, charlist), do: Enum.reverse(charlist)
  #
  # defp do_decode(<<first::4, rest::bitstring>>, charlist) do
  #   decoded = decode_nucleotide(first)
  #   do_decode(rest, [decoded | charlist])
  # end

  # def decode(<<>>), do: ~c""
  #
  # def decode(<<first::4, rest::bitstring>>) do
  #   [decode_nucleotide(first) | decode(rest)]
  # end

  def decode(dna), do: do_decode(dna, ~c"")

  defp do_decode(<<>>, charlist), do: reverse(charlist, ~c"")

  defp do_decode(<<first::4, rest::bitstring>>, charlist) do
    decoded = decode_nucleotide(first)
    do_decode(rest, [decoded | charlist])
  end

  defp reverse([], acc), do: acc
  defp reverse([head | tail], acc), do: reverse(tail, [head | acc])
end
