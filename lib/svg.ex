defmodule Svg do
  defstruct [:width, :height, :elements]

  defguard is_positive(value) when is_number(value) and value >= 0
  defguard is_point(x, y) when is_positive(x) and is_positive(y)

  alias Svg.{Circle, Image, Line, Text}

  def init(width, height) when is_positive(width) and is_positive(height) do
    %__MODULE__{width: width, height: height, elements: []}
  end

  def add(svg, line = %Line{}), do: add_element(svg, line)
  def add(svg, circle = %Circle{}), do: add_element(svg, circle)
  def add(svg, text = %Text{}), do: add_element(svg, text)
  def add(svg, image = %Image{}), do: add_element(svg, image)

  def elements(%__MODULE__{elements: elts}), do: Enum.reverse(elts)

  def render(svg = %__MODULE__{}), do: Svg.Render.render(svg)

  defp add_element(svg, elt), do: %__MODULE__{svg | elements: [elt | svg.elements]}
end
