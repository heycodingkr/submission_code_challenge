defmodule HelloWeb.Gateway do
  use HTTPoison.Base

  @endpoint "https://api.github.com/search/repositories"

  def endpoint do
    @endpoint
  end

  defp process_url(url) do
    @endpoint <> url
  end

  defp process_request_headers(headers) do
    headers ++ [
      {"Authorization", "Basic #{:base64.encode(credentials)}"}
    ]
  end

  defp credentials do
    "#{config[:access_token]}:x-oauth-basic"
  end

  defp config do
    # Application.get_env(:my_app, __MODULE__)
  end
end


defmodule HelloWeb.ResultStream do
  alias HelloWeb.Gateway
  def new(url) do
    fetch_page(url)
    # Stream.resource(
    #   fn -> fetch_page(url) end,
    #   &process_page/1,
    #   fn _ -> end
    # )
  end

  defp fetch_page(url) do
    response = Gateway.get!(url)
    items = Poison.decode!(response.body)
    links = parse_links(List.keyfind(response.headers, "Link", 0))
    {items, links}
    # {items, links["next"]}
  end

  def parse_links(nil) do
    %{}
  end

  def parse_links(links_string) do
    {"Link", tuple} = links_string
    links = String.split(tuple, ", ")
    Enum.map(links, fn link ->
      [_,name] = Regex.run(~r{rel="([a-z]+)"}, link)
      [_,url] = Regex.run(~r{<([^>]+)>}, link)
      short_url = String.replace(url, Gateway.endpoint, "")
      {name, short_url}
    end) |> Enum.into(%{})
  end

  defp process_page({nil, nil}) do
    {:halt, nil}
  end

  defp process_page({nil, next_page_url}) do
    next_page_url
    |> fetch_page
    |> process_page
  end

  defp process_page({items, next_page_url}) do
    {items["items"], {nil, next_page_url}}
  end
end
