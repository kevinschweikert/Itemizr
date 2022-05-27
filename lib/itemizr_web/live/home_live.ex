defmodule ItemizrWeb.HomeLive do
  use ItemizrWeb, :live_view

  def mount(_conn, _params, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.h1>HomeLive</.h1>
    """
  end
end
