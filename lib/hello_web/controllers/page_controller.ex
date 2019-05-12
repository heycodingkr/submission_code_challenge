defmodule HelloWeb.PageController do
  use HelloWeb, :controller


  def index(conn, params) do
    q = params["q"] || "elixir"
    page = params["page"] || "1"
    per_page = params["per_page"] || "10"
    result = Hello.repos({q, page, per_page})
    render(conn, "index.html",
      github: elem(result, 0),
      link: elem(result, 1))
  end

end
