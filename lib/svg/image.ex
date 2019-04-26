defmodule Svg.Image do
  defstruct [:height, :location, :width, :url]

  alias Svg.Point
  import Point, only: [is_point: 2, is_positive: 1]

  def init(url, x, y, width, height) when is_point(x, y) and is_positive(width) and is_positive(height) do
    %__MODULE__{url: url, location: %Point{x: x, y: y}, width: width, height: height}
  end
end

defimpl Svg.Render, for: Svg.Image do
  def render(%Svg.Image{url: url, location: pt, width: w, height: h}, _opts) do
    ['<image width="', Integer.to_charlist(w), '" height="', Integer.to_charlist(h), '"', Svg.Render.render(pt), 'xlink:href="', url, '" />']
  end
end
