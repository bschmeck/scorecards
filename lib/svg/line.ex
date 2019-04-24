defmodule Svg.Line do
  defstruct [:point1, :point2]

  alias Svg.Point

  defguard is_positive(value) when is_number(value) and value >= 0
  defguard is_point(x, y) when is_positive(x) and is_positive(y)

  def init(x1, y1, x2, y2) when is_point(x1, y1) and is_point(x2, y2) do
    %__MODULE__{point1: %Point{x: x1, y: y1}, point2: %Point{x: x2, y: y2}}
  end
end
