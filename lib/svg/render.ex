defmodule Svg.Render do
  alias Svg.Point

  def render(svg = %Svg{}) do
    [preamble, open_tag(svg), render_elements(Svg.elements(svg)), close_tag]
  end

  defp preamble do
    ['<?xml version="1.0" standalone="no"?>

<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">']
  end

  defp open_tag(%Svg{width: w, height: h}) do
    ['<svg width="', Integer.to_charlist(w), '" height="', Integer.to_charlist(h), '" version="1.1"
    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">']
  end

  defp close_tag, do: ['</svg>']

  defp render_elements(elts), do: render_elements(elts, [])
  defp render_elements([], list), do: list
  defp render_elements([elt | rest], list) do
    render_elements(rest, [list, render_element(elt)])
  end

  defp render_element({:line, pt1, pt2}) do
    ['<line', render_point(pt1, '1'), render_point(pt2, '2'),
     'style="stroke:rgb(255,0,0);stroke-width:2" />']
  end

  defp render_element({:circle, %Point{x: x, y: y}, r}) do
    ['<circle cx="', Integer.to_charlist(x), '" cy="', Integer.to_charlist(y), '" r="', Integer.to_charlist(r), '" style="stroke:black; fill:black;" />']
  end

  defp render_element({:text, text, pt}) do
    ['<text', render_point(pt), 'fill="black" style="font-family:Arial; font-size:10pt; font-weight:normal;">', text, '</text>']
  end

  defp render_point(pt = %Point{}), do: render_point(pt, '')
  defp render_point(%Point{x: x, y: y}, suffix) do
    [' x', suffix, '="',
     Integer.to_charlist(x),
     '" y', suffix, '="',
     Integer.to_charlist(y),
     '" ']
  end
end
