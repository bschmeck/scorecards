defmodule Svg.Text do
  defstruct [:location, :string, :style]

  alias Svg.{Point, Style}
  import Point, only: [is_point: 2]

  def init(text, x, y, style \\ Style.default(:text)) when is_point(x, y) do
    %__MODULE__{string: text, location: %Point{x: x, y: y}, style: style}
  end
end

defimpl Svg.Render, for: Svg.Text do
  def render(%Svg.Text{string: text, location: pt, style: style}, _opts) do
    ['<text', Svg.Render.render(pt), ' ', Svg.Render.render(style), '><![CDATA[', text, ']]></text>']
    end
end
