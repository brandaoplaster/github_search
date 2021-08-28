defmodule GithubSearchWeb.SearchController do
  use GithubSearchWeb, :controller

  alias GithubSearch.ExternalApi.Client

  def search_user(conn, params) do
    with {:ok, repositories} <- Client.search_user_github(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", repositories: repositories)
    end
  end
end
