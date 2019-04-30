defmodule Svg do
  defstruct [:width, :height, :elements]

  defguard is_positive(value) when is_number(value) and value >= 0

  alias Svg.{Circle, Image, Line, Text}

  def init(width, height) when is_positive(width) and is_positive(height) do
    %__MODULE__{width: width, height: height, elements: []}
  end

  def add(svg, line = %Line{}), do: add_element(svg, line)
  def add(svg, circle = %Circle{}), do: add_element(svg, circle)
  def add(svg, text = %Text{}), do: add_element(svg, text)
  def add(svg, image = %Image{}), do: add_element(svg, image)

  def elements(%__MODULE__{elements: elts}), do: elts

  def render(svg = %__MODULE__{}), do: Svg.Render.render(svg)

  defp add_element(svg, elt), do: %__MODULE__{svg | elements: [elt | svg.elements]}
end

defimpl Svg.Render, for: Svg do
  def render(svg = %Svg{}, _opts) do
    [preamble(), open_tag(svg), Enum.map(Svg.elements(svg), &Svg.Render.render/1), close_tag()]
  end

  defp preamble do
    ['<?xml version="1.0" standalone="no"?>

<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">']
  end

  defp open_tag(%Svg{width: w, height: h}) do
    ['<svg width=', Svg.Render.render(w, quoted: true), ' height=', Svg.Render.render(h, quoted: true), ' version="1.1"
    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">']
  end

  defp close_tag, do: ['</svg>']
end
