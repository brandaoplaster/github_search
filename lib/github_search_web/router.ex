defmodule GithubSearchWeb.Router do
  use GithubSearchWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GithubSearchWeb do
    pipe_through :api

    post "/search", SearchController, :search_user
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: GithubSearchWeb.Telemetry
    end
  end
end
