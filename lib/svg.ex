defmodule Svg do
  defstruct [:width, :height, :elements]

  def init(width, height) do
    %__MODULE__{width: width, height: height, elements: []}
  end

  def add_line(svg, x1, y1, x2, y2) do
    %__MODULE__{svg | elements: [{:line, x1, y1, x2, y2} | svg.elements]}
  end

  def elements(%__MODULE__{elements: elts}), do: Enum.reverse(elts)

  def render(svg = %__MODULE__{}), do: Svg.Render.render(svg)
end
