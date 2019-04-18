defmodule ScorecardsWeb.PageController do
  use ScorecardsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def line(conn, _params) do
    svg = Svg.init(100, 100)
    |> Svg.add_line(0, 0, 70, 80)
    |> Svg.add_circle(20, 20, 10)
    |> Svg.add_text("foobar", 5, 5)

    conn
    |> put_resp_content_type("image/svg+xml")
    |> text(Svg.render(svg))
  end
end
