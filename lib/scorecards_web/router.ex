defmodule ScorecardsWeb.Router do
  use ScorecardsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ScorecardsWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/line.svg", PageController, :line
  end

  # Other scopes may use custom stacks.
  # scope "/api", ScorecardsWeb do
  #   pipe_through :api
  # end
end
