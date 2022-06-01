defmodule ItemizrWeb.AssetsLive do
  use ItemizrWeb, :live_view

  @impl true
  def mount(_conn, _params, socket) do
    assets = Itemizr.Inventory.get_assets()

    {:ok, assign(socket, assets: assets)}
  end

  @impl true
  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  # The modal component emits this event when `PetalComponents.Modal.hide_modal()` is called.
  # This happens when the user clicks the dark background or the 'X'.
  @impl true
  def handle_event("close_modal", _, socket) do
    # Go back to the :index live action
    {:noreply, push_patch(socket, to: "/assets")}
  end
end
