defmodule Svg do
  defstruct [:width, :height]

  def init(width, height) do
    %__MODULE__{width: width, height: height}
  end

  def render(%__MODULE__{height: h, width: w}) do
    "<?xml version=\"1.0\" standalone=\"no\"?>

<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\"
\"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\">

<svg width=\"#{w}\" height=\"#{h}\" version=\"1.1\"
xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">
<line x1=\"0\" y1=\"0\" x2=\"80\" y2=\"70\" style=\"stroke:rgb(255,0,0);stroke-width:2\" />
</svg>"
  end
end
