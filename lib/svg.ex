defmodule Svg do
  defstruct [:width, :height, :elements]

  defguard is_positive(value) when is_number(value) and value >= 0
  defguard is_point(x, y) when is_positive(x) and is_positive(y)

  alias Svg.Point

  def init(width, height) when is_positive(width) and is_positive(height) do
    %__MODULE__{width: width, height: height, elements: []}
  end

  def add_line(svg, x1, y1, x2, y2) when is_point(x1, y1) and is_point(x2, y2) do
    %__MODULE__{svg | elements: [{:line, %Point{x: x1, y: y1}, %Point{x: x2, y: y2}} | svg.elements]}
  end

  def add_circle(svg, x, y, r) when is_point(x, y) and is_positive(r) do
    %__MODULE__{svg | elements: [{:circle, %Point{x: x, y: y}, r} | svg.elements]}
  end

  def add_text(svg, text, x, y) when is_point(x, y) do
    %__MODULE__{svg | elements: [{:text, text, %Point{x: x, y: y}} | svg.elements]}
  end

  def elements(%__MODULE__{elements: elts}), do: Enum.reverse(elts)

  def render(svg = %__MODULE__{}), do: Svg.Render.render(svg)
end
