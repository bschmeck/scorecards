defmodule SvgTest do
  use ExUnit.Case

  test "it renders an SVG" do
    svg = Svg.init(100, 100)
    assert Svg.render(svg) =~ ~r/<svg.*<\/svg>/ms
  end

  test "it includes height in the SVG" do
    height = 99
    width = 88
    svg = Svg.init(width, height)
    assert Svg.render(svg) =~ ~r/<svg .*height="#{height}"/
  end

  test "it includes width in the SVG" do
    height = 99
    width = 88
    svg = Svg.init(width, height)
    assert Svg.render(svg) =~ ~r/<svg .*width="#{width}"/
  end
end
