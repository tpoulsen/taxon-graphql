defmodule Taxon.Router do
  use Taxon.Web, :router

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

  scope "/", Taxon do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: Taxon.Schema

  # Other scopes may use custom stacks.
  # scope "/api", Taxon do
  #   pipe_through :api
  # end
end
