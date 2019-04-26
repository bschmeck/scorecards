defmodule Svg.Line do
  defstruct [:point1, :point2, :style]

  alias Svg.{Point, Style}
  import Point, only: [is_point: 2]

  def init(x1, y1, x2, y2, style \\ Style.default(:line)) when is_point(x1, y1) and is_point(x2, y2) do
    %__MODULE__{point1: %Point{x: x1, y: y1}, point2: %Point{x: x2, y: y2}, style: style}
  end
end

defimpl Svg.Render, for: Svg.Line do
  def render(%Svg.Line{point1: pt1, point2: pt2, style: style}, _opts) do
    ['<line', Svg.Render.render(pt1, suffix: '1'), Svg.Render.render(pt2, suffix: '2'),
     Svg.Render.render(style), ' />']
  end
end
