defmodule Svg.Style do
  defstruct [:fill, :font_family, :font_size, :font_weight, :stroke, :stroke_width]

  def default(:line) do
    %__MODULE__{stroke: "rgb(0,0,0)", stroke_width: 2}
  end

  def to_list(style) do
    style |> Map.from_struct |> Map.to_list
  end
end
