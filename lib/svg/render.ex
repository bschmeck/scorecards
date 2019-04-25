defmodule Svg.Render do
  alias Svg.Point

  def render(svg = %Svg{}) do
    [preamble(), open_tag(svg), Enum.map(Svg.elements(svg), &render_element/1), close_tag()]
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

  defp render_element(%Svg.Line{point1: pt1, point2: pt2}) do
    ['<line', render_point(pt1, suffix: '1'), render_point(pt2, suffix: '2'),
     'style="stroke:rgb(255,0,0);stroke-width:2" />']
  end

  defp render_element(%Svg.Circle{center: pt, radius: r}) do
    ['<circle', render_point(pt, prefix: 'c'), 'r="', Integer.to_charlist(r), '" style="stroke:black; fill:black;" />']
  end

  defp render_element(%Svg.Text{string: text, location: pt}) do
    ['<text', render_point(pt), 'fill="black" style="font-family:Arial; font-size:10pt; font-weight:normal;"><![CDATA[', text, ']]></text>']
  end

  defp render_element(%Svg.Image{url: url, location: pt, width: w, height: h}) do
    ['<image width="', Integer.to_charlist(w), '" height="', Integer.to_charlist(h), '"', render_point(pt), 'xlink:href="', url, '" />']
  end

  defp render_point(pt = %Point{}), do: render_point(pt, '')
  defp render_point(%Point{x: x, y: y}, opts) do
    suffix = Keyword.get(opts, :suffix, '')
    prefix = Keyword.get(opts, :prefix, '')

    [' ', prefix, 'x', suffix, '="',
     Integer.to_charlist(x),
     '" ', prefix, 'y', suffix, '="',
     Integer.to_charlist(y),
     '" ']
  end
end
