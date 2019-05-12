defmodule HelloWeb.PageView do
  use HelloWeb, :view

  def active_class(conn, i) do
    if i == getPage(conn.query_string) do
      "page-item active"
    else
      nil
    end
  end

  def getCurrent(conn) do
    getPage(conn.query_string)
  end

  def getPage(link) do
    if link !== "" && !is_nil(link) do
      result = String.split(link, ["page=","&per"])
      String.to_integer(Enum.at(result, 1))
    else
      1
    end
  end

  def is_last(link) do
    if is_nil(link) do
      "page-item active"
    else
      nil
    end
  end

  def getLast(link) do
    if !is_nil(link["last"]) do
      result = String.split(link["last"], ["page=","&per"])
      String.to_integer(Enum.at(result, 1))
    else
      if !is_nil(link["prev"]) do
        result = String.split(link["prev"], ["'page='","'&per'"])
        String.to_integer(Enum.at(result, 1)) + 1
      end
    end
  end

  def render("index.html", %{page: page}) do
     %{data: page}
  end

end
