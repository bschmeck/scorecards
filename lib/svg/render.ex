defmodule Svg.Render do
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

  defp render_element({:circle, x, y, r}) do
    ['<circle cx="', Integer.to_charlist(x), '" cy="', Integer.to_charlist(y), '" r="', Integer.to_charlist(r), '" style="stroke:black; fill:black;" />']
  end

  defp render_element({:text, text, x, y}) do
    ['<text x="', Integer.to_charlist(x), '" y="', Integer.to_charlist(y), '" fill="black" style="font-family:Arial; font-size:10pt; font-weight:normal;">', text, '</text>']
  end
end
