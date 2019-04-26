defmodule Svg.Color do
  defstruct [:blue, :green, :red]

  defguard is_byte(val) when val >= 0 and val <= 255

  def init(r, g, b) when is_byte(r) and is_byte(g) and is_byte(b) do
    %__MODULE__{red: r, green: g, blue: b}
  end

  def black, do: init(0, 0, 0)
  def red, do: init(255, 0, 0)
end
