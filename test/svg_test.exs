defmodule SvgTest do
  use ExUnit.Case

  test "it renders an SVG" do
    svg = Svg.init(100, 100)
    rendered = svg |> Svg.render |> IO.iodata_to_binary
    assert rendered =~ ~r/<svg.*<\/svg>/ms
  end

  test "it includes height in the SVG" do
    height = 99
    width = 88
    svg = Svg.init(width, height)
    rendered = svg |> Svg.render |> IO.iodata_to_binary
    assert rendered =~ ~r/<svg .*height="#{height}"/
  end

  test "it includes width in the SVG" do
    height = 99
    width = 88
    svg = Svg.init(width, height)
    rendered = svg |> Svg.render |> IO.iodata_to_binary
    assert rendered =~ ~r/<svg .*width="#{width}"/
  end

  test "it renders a line" do
    height = 99
    width = 88
    svg = Svg.init(width, height) |> Svg.add_line(0, 1, 2, 3)
    rendered = svg |> Svg.render |> IO.iodata_to_binary
    assert rendered =~ ~r/<line\s+x1="0"\s+y1="1"\s+x2="2"\s+y2="3"/
  end

  test "it renders a circle" do
    height = 99
    width = 88
    svg = Svg.init(width, height) |> Svg.add_circle(0, 1, 2)
    rendered = svg |> Svg.render |> IO.iodata_to_binary
    assert rendered =~ ~r/<circle\s+cx="0"\s+cy="1"\s+r="2"/
  end

  test "it renders an image" do
    height = 99
    width = 88
    url = "http://example.com/image.jpeg"
    svg = Svg.init(width, height) |> Svg.add_image(url, 0, 1, 2, 3)
    rendered = svg |> Svg.render |> IO.iodata_to_binary
    assert rendered =~ ~r/<image\s+width="2"\s+height="3"\s+x="0"\s+y="1"\s+xlink:href="#{url}" \/>/
  end
end
