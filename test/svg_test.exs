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
end
