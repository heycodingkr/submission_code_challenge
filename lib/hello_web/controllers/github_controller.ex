defmodule HelloWeb.GithubController do
  use HelloWeb, :controller

  def index(conn, params) do
    page = params["page"]
    result = {"elixir", page}
    |> Hello.repos
    IO.inspect elem(result, 1)
    json(conn, [ elem(result, 0), elem(result, 1)])
  end

end
