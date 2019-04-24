defmodule Svg.Text do
  defstruct [:string, :location]

  alias Svg.Point
  import Point, only: [is_point: 2]

  def init(text, x, y) when is_point(x, y) do
    %__MODULE__{string: text, location: %Point{x: x, y: y}}
  end
end
