defmodule Svg.Image do
  defstruct [:height, :location, :width, :url]

  defguard is_positive(value) when is_number(value) and value >= 0
  defguard is_point(x, y) when is_positive(x) and is_positive(y)

  alias Svg.Point

  def init(url, x, y, width, height) when is_point(x, y) and is_positive(width) and is_positive(height) do
    %__MODULE__{url: url, location: %Point{x: x, y: y}, width: width, height: height}
  end
end
