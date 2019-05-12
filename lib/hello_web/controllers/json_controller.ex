defmodule HelloWeb.JsonController do
  # require Logger
  use HelloWeb, :controller

  defp jsonModifier(list) do
    height = Enum.count(list) - 1
    endNodeList= list[Integer.to_string(height)]
    addChildren(list, endNodeList)
  end

  defp addChildren(list, nextLevelList) do
    next = Enum.at(nextLevelList, 0)["level"]
    prev = list[Integer.to_string(next - 1)]
    if is_list(nextLevelList) && !is_nil(nextLevelList) do
      if !is_nil(prev) do
        result = Enum.map(prev, fn x -> Map.put(x, "children", filteredList(nextLevelList, x)) end)
        addChildren(list, result) # recursive
      else
        nextLevelList
      end
    end
  end

  defp filteredList(list, compare) do
    Enum.filter(list, fn v -> v["parent_id"] === compare["id"] end)
  end

  def index(conn, params) do
    json(conn, jsonModifier(params))
  end
end
