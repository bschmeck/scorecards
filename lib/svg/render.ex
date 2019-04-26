defprotocol Svg.Render do
  @doc "Renders an SVG element to XML"
  def render(element, opts \\ [])
end
