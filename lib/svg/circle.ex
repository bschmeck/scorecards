defmodule Svg.Circle do
  defstruct [:center, :radius]

  alias Svg.Point
  import Point, only: [is_point: 2, is_positive: 1]

  def init(x, y, r) when is_point(x, y) and is_positive(r) do
    %__MODULE__{center: %Point{x: x, y: y}, radius: r}
  end
end

defimpl Svg.Render, for: Svg.Circle do
  def render(%Svg.Circle{center: pt, radius: r}, _opts) do
    ['<circle', Svg.Render.render(pt, prefix: 'c'), 'r="', Integer.to_charlist(r), '" style="stroke:black; fill:black;" />']
  end
end
