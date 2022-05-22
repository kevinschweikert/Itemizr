defmodule ItemizrWeb.PageController do
  use ItemizrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
