defmodule MovieStore.Router do
  use MovieStore.Web, :router

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

  scope "/", MovieStore do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/theaters", TheaterController
    resources "/movies", MovieController
    resources "/showings", ShowingController
    resources "/tickets", TicketController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MovieStore do
  #   pipe_through :api
  # end
end
