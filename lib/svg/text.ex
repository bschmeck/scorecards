defmodule Svg.Text do
  defstruct [:string, :location]

  alias Svg.Point
  import Point, only: [is_point: 2]

  def init(text, x, y) when is_point(x, y) do
    %__MODULE__{string: text, location: %Point{x: x, y: y}}
  end
end

defimpl Svg.Render, for: Svg.Text do
  def render(%Svg.Text{string: text, location: pt}, _opts) do
    ['<text', Svg.Render.render(pt), 'fill="black" style="font-family:Arial; font-size:10pt; font-weight:normal;"><![CDATA[', text, ']]></text>']
    end
end
