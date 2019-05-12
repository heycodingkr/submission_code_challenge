defmodule Hello do
  @moduledoc """
  Hello keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias HelloWeb.ResultStream

  def repos({word, page, per_page}) do
    default = "q=elixir&page=1&per_page=10"
    if word && page && per_page do
      ResultStream.new("?q=#{word}&page=#{page}&per_page=#{per_page}")
      else
      ResultStream.new(default)
      end
    end

  end
