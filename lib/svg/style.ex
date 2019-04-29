defmodule Svg.Style do
  defstruct [:fill, :font_family, :font_size, :font_weight, :stroke, :stroke_width]

  def default(:line) do
    %__MODULE__{stroke: Svg.Color.black, stroke_width: 2}
  end

  def default(:circle) do
    %__MODULE__{stroke: Svg.Color.black, fill: Svg.Color.black}
  end

  def to_list(style) do
    style |> Map.from_struct |> Map.to_list
  end
end

defimpl Svg.Render, for: Svg.Style do
  def render(style = %Svg.Style{}, _opts) do
    [' style="', Enum.map(Svg.Style.to_list(style), &do_render/1), '"']
  end

  defp do_render({_, nil}), do: []
  defp do_render({:stroke, color = %Svg.Color{}}), do: ['stroke: ', Svg.Render.render(color), ';']
  defp do_render({:stroke_width, w}), do: ['stroke-width:', Integer.to_charlist(w), ';']
  defp do_render({:fill, color = %Svg.Color{}}), do: ['fill: ', Svg.Render.render(color), ';']
end
