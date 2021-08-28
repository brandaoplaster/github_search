defmodule GithubSearchWeb.ErrorView do
  use GithubSearchWeb, :view

  def render("error.json", %{message: message}), do: %{message: message}

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
