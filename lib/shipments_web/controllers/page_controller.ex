defmodule ShipmentsWeb.PageController do
  use ShipmentsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
