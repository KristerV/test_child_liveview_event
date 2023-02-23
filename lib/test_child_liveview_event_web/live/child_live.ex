defmodule TestChildLiveviewEventWeb.ChildLive do
  use TestChildLiveviewEventWeb, :live_view

  def render(assigns) do
    ~L"""
    <button class="bg-gray-200" phx-click="click">Click here and check console</button>
    """
  end

  def handle_event("click", _params, socket) do
    IO.puts("CLICKED child")
    {:noreply, socket}
  end
end
