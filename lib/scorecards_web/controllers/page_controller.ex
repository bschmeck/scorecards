defmodule ScorecardsWeb.PageController do
  use ScorecardsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def line(conn, _params) do
    svg = Svg.init(400, 400)
    |> Svg.add(Svg.Line.init(0, 0, 70, 80))
    |> Svg.add(Svg.Circle.init(20, 20, 10))
    |> Svg.add(Svg.Text.init("foobar</text><line x1=\"20\" y1=\"5\" x2=\"12\" y2=\"14\" style=\"stroke:rgb(255,0,0);stroke-width:2\"/><text>", 55, 25))
    |> Svg.add(Svg.Image.init("http://mlb.mlb.com/images/logos/80x80/chc.png", 200, 200, 40, 40))

    conn
    |> put_resp_content_type("image/svg+xml")
    |> text(Svg.render(svg))
  end
end
