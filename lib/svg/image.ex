defmodule Svg.Image do
  defstruct [:height, :location, :width, :url]

  alias Svg.Point
  import Point, only: [is_point: 2, is_positive: 1]

  def init(url, x, y, width, height) when is_point(x, y) and is_positive(width) and is_positive(height) do
    %__MODULE__{url: url, location: %Point{x: x, y: y}, width: width, height: height}
  end
end
