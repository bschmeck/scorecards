defmodule Svg.Text do
  defstruct [:string, :location]

  defguard is_positive(value) when is_number(value) and value >= 0
  defguard is_point(x, y) when is_positive(x) and is_positive(y)

  alias Svg.Point

  def init(text, x, y) when is_point(x, y) do
    %__MODULE__{string: text, location: %Point{x: x, y: y}}
  end
end
