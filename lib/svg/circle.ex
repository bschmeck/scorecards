defmodule Svg.Circle do
  defstruct [:center, :radius, :style]

  alias Svg.{Point, Style}
  import Point, only: [is_point: 2, is_positive: 1]

  def init(x, y, r, style \\ Style.default(:circle)) when is_point(x, y) and is_positive(r) do
    %__MODULE__{center: %Point{x: x, y: y}, radius: r, style: style}
  end
end

defimpl Svg.Render, for: Svg.Circle do
  def render(%Svg.Circle{center: pt, radius: r, style: style}, _opts) do
    ['<circle', Svg.Render.render(pt, prefix: 'c'), 'r="', Integer.to_charlist(r), '" ', Svg.Render.render(style), ' />']
  end
end
