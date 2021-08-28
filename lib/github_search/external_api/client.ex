defmodule GithubSearch.ExternalApi.Client do
  use Tesla

  alias Tesla.Env

  plug(Tesla.Middleware.BaseUrl, "https://api.github.com/users/")
  plug(Tesla.Middleware.Headers, [{"user-agent", "request"}])
  plug(Tesla.Middleware.JSON)

  def search_user_github(%{"username" => username}) do
    "#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 404}}) do
    {:error, "Not found"}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    response =
      body
      |> Enum.map(fn item ->
        %{
          "id" => item["id"],
          "name" => item["name"],
          "description" => item["description"],
          "html_url" => item["html_url"],
          "stargazers_count" => item["stargazers_count"]
        }
      end)

    {:ok, response}
  end
end
