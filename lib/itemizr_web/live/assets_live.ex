defmodule ItemizrWeb.AssetsLive do
  use ItemizrWeb, :live_view

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    assets = Itemizr.Inventory.get_assets()

    ~H"""
    <.h1> Assets </.h1>
    <.table>
      <.tr>
        <.th> Name </.th>
        <.th> Status </.th>
        <.th> Owner </.th>
      </.tr>
    <%= for asset <- assets do %>
      <.tr>
        <.td><%= asset.name %></.td>
        <.td> <.badge color="success" label={Atom.to_string(asset.status)} /></.td>
        <.td><%= if asset.owner, do: asset.owner.name, else: "-" %></.td>
      </.tr>
    <% end %>
    </.table>
    """
  end
end
