defmodule Svg do
  defstruct [:width, :height, :elements]

  def init(width, height) do
    %__MODULE__{width: width, height: height, elements: []}
  end

  def add_line(svg, x1, y1, x2, y2) do
    %__MODULE__{svg | elements: [{:line, x1, y1, x2, y2} | svg.elements]}
  end
  def render(svg = %__MODULE__{}) do
    [preamble, open_tag(svg), render_elements(Enum.reverse(svg.elements)), close_tag]
  end

  defp preamble do
    ['<?xml version="1.0" standalone="no"?>

<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">']
  end

  defp open_tag(%__MODULE__{width: w, height: h}) do
    ['<svg width="', Integer.to_charlist(w), '" height="', Integer.to_charlist(h), '" version="1.1"
    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">']
  end

  defp close_tag, do: ['</svg>']

  defp render_elements(elts), do: render_elements(elts, [])
  defp render_elements([], list), do: list
  defp render_elements([elt | rest], list) do
    render_elements(rest, [list, render_element(elt)])
  end

  defp render_element({:line, x1, y1, x2, y2}) do
    ['<line x1="',
     Integer.to_charlist(x1),
     '" y1="',
     Integer.to_charlist(y1),
     '" x2="',
     Integer.to_charlist(x2),
     '" y2="',
     Integer.to_charlist(y2),
     '" style="stroke:rgb(255,0,0);stroke-width:2" />']
  end
end
