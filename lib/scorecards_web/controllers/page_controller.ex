defmodule ScorecardsWeb.PageController do
  use ScorecardsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
