defprotocol Svg.Render do
  @doc "Renders an SVG element to XML"
  def render(element, opts \\ [])
end

defimpl Svg.Render, for: Float do
  def render(float, _opts), do: Float.to_charlist(float)
end

defimpl Svg.Render, for: Integer do
  def render(float, _opts), do: Integer.to_charlist(float)
end
