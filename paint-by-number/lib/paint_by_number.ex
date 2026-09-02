defmodule PaintByNumber do
  @moduledoc """
  Exercism exercise - Paint by number
  """
  import Bitwise

  def palette_bit_size(color_count), do: do_palette_bit_size(color_count, 0)

  defp do_palette_bit_size(color_count, n)
       when bsl(1, n) < color_count do
    do_palette_bit_size(color_count, n + 1)
  end

  defp do_palette_bit_size(_color_count, n), do: n

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count) do
    nil
  end

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<first_pixel::size(^bit_size), _rest::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(<<>>, _color_count) do
    empty_picture()
  end

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_first_pixel::size(^bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
