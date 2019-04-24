defmodule Svg.Point do
  defstruct [:x, :y]

  defguard is_positive(value) when is_number(value) and value >= 0
  defguard is_point(x, y) when is_positive(x) and is_positive(y)
end
