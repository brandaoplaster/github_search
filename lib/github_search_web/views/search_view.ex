defmodule GithubSearchWeb.SearchView do
  use GithubSearchWeb, :view

  def render("show.json", %{repositories: repositories}) do
    %{data: repositories}
  end
end
