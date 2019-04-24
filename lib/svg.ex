defmodule Svg do
  defstruct [:width, :height, :elements]

  defguard is_positive(value) when is_number(value) and value >= 0
  defguard is_point(x, y) when is_positive(x) and is_positive(y)

  alias Svg.{Circle, Image, Line, Text}

  def init(width, height) when is_positive(width) and is_positive(height) do
    %__MODULE__{width: width, height: height, elements: []}
  end

  def add(svg, line = %Line{}), do: %__MODULE__{svg | elements: [line | svg.elements]}
  def add(svg, circle = %Circle{}), do: %__MODULE__{svg | elements: [circle | svg.elements]}
  def add(svg, text = %Text{}), do: %__MODULE__{svg | elements: [text | svg.elements]}
  def add(svg, image = %Image{}), do: %__MODULE__{svg | elements: [image | svg.elements]}

  def elements(%__MODULE__{elements: elts}), do: Enum.reverse(elts)

  def render(svg = %__MODULE__{}), do: Svg.Render.render(svg)
end
