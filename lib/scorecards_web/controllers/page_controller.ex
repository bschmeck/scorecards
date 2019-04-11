defmodule ScorecardsWeb.PageController do
  use ScorecardsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def line(conn, _params) do
    svg = Svg.init(100, 100)
    conn
    |> put_resp_content_type("image/svg+xml")
    |> text Svg.render(svg)
  end
end
