defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/:page", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", HelloWeb do
    pipe_through :api

    post "/test", JsonController, :index
    get "/github", GithubController, :index
  end
end
