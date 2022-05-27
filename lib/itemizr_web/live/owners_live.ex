defmodule ItemizrWeb.OwnersLive do
  use ItemizrWeb, :live_view

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    owners = Itemizr.Inventory.get_owners()

    ~H"""
    <.h1> Owners </.h1>
    <.table>
      <.tr>
        <.th> Name </.th>
        <.th> No. of Assets </.th>
      </.tr>
    <%= for owner <- owners do %>
      <.tr>
        <.td><%= owner.name %></.td>
        <.td><%= Enum.count(owner.assets) %></.td>
      </.tr>
    <% end %>
    </.table>
    """
  end
end
