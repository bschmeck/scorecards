defprotocol Svg.Render do
  @doc "Renders an SVG element to XML"
  def render(element, opts \\ [])
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
    ['<svg width="', Integer.to_charlist(w), '" height="', Integer.to_charlist(h), '" version="1.1"
    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">']
  end

  defp close_tag, do: ['</svg>']
end

defimpl Svg.Render, for: Svg.Line do
  def render(%Svg.Line{point1: pt1, point2: pt2, style: style}, _opts) do
    ['<line', Svg.Render.render(pt1, suffix: '1'), Svg.Render.render(pt2, suffix: '2'),
     Svg.Render.render(style), ' />']
  end
end

defimpl Svg.Render, for: Svg.Circle do
  def render(%Svg.Circle{center: pt, radius: r}, _opts) do
    ['<circle', Svg.Render.render(pt, prefix: 'c'), 'r="', Integer.to_charlist(r), '" style="stroke:black; fill:black;" />']
    end
  end

defimpl Svg.Render, for: Svg.Text do
  def render(%Svg.Text{string: text, location: pt}, _opts) do
    ['<text', Svg.Render.render(pt), 'fill="black" style="font-family:Arial; font-size:10pt; font-weight:normal;"><![CDATA[', text, ']]></text>']
    end
end

defimpl Svg.Render, for: Svg.Image do
  def render(%Svg.Image{url: url, location: pt, width: w, height: h}, _opts) do
    ['<image width="', Integer.to_charlist(w), '" height="', Integer.to_charlist(h), '"', Svg.Render.render(pt), 'xlink:href="', url, '" />']
  end
end

defimpl Svg.Render, for: Svg.Point do
  def render(%Svg.Point{x: x, y: y}, opts) do
    suffix = Keyword.get(opts, :suffix, '')
    prefix = Keyword.get(opts, :prefix, '')

    [' ', prefix, 'x', suffix, '="',
     Integer.to_charlist(x),
     '" ', prefix, 'y', suffix, '="',
     Integer.to_charlist(y),
     '" ']
  end
end

defimpl Svg.Render, for: Svg.Style do
  def render(style = %Svg.Style{}, _opts) do
    [' style="', Enum.map(Svg.Style.to_list(style), &do_render/1), '"']
  end

  defp do_render({_, nil}), do: []
  defp do_render({:stroke, color = %Svg.Color{}}), do: ['stroke: ', Svg.Render.render(color), ';']
  defp do_render({:stroke_width, w}), do: ['stroke-width:', Integer.to_charlist(w), ';']
end

defimpl Svg.Render, for: Svg.Color do
  def render(%Svg.Color{red: r, green: g, blue: b}, _opts) do
    ['rgb(', Integer.to_charlist(r), ',', Integer.to_charlist(g), ',', Integer.to_charlist(b), ')']
  end
end
