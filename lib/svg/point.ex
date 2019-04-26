defmodule Svg.Point do
  defstruct [:x, :y]

  defguard is_positive(value) when is_number(value) and value >= 0
  defguard is_point(x, y) when is_positive(x) and is_positive(y)
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
