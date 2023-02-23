defmodule TestChildLiveviewEventWeb.ParentLive do
  use TestChildLiveviewEventWeb, :live_view
  alias TestChildLiveviewEventWeb.ChildLive

  def render(assigns) do
    ~L"""
    <%= live_render(@socket, ChildLive, id: "child-component") %>
    """
  end

  def handle_event("click", _params, socket) do
    IO.puts("CLICKED parent")
    {:noreply, socket}
  end
end
