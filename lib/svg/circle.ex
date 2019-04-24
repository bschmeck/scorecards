defmodule Svg.Circle do
  defstruct [:center, :radius]

  defguard is_positive(value) when is_number(value) and value >= 0
  defguard is_point(x, y) when is_positive(x) and is_positive(y)

  alias Svg.Point

  def init(x, y, r) when is_point(x, y) and is_positive(r) do
    %__MODULE__{center: %Point{x: x, y: y}, radius: r}
  end
end
