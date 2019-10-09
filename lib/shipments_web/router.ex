defmodule ShipmentsWeb.Router do
  use ShipmentsWeb, :router

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

  scope "/", ShipmentsWeb do
    pipe_through :browser
    resources "/", RefundController, only: [:index, :create, :new, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShipmentsWeb do
  #   pipe_through :api
  # end
end
