defprotocol Svg.Render do
  @doc "Renders an SVG element to XML"
  def render(element, opts \\ [])
end

defimpl Svg.Render, for: Float do
  def render(float, _opts), do: Float.to_charlist(float)
end

defimpl Svg.Render, for: Integer do
  def render(integer, quoted: true), do: ['"', Svg.Render.render(integer), '"']
  def render(integer, _opts), do: Integer.to_charlist(integer)
end
