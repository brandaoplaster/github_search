defmodule GithubSearchWeb.FallbackController do
  use GithubSearchWeb, :controller

  alias GithubSearch.Error
  alias GithubSearchWeb.ErrorView

  def call(conn, {:error, %Error{status: status, message: message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", message: message)
  end
end
