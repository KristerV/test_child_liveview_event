defmodule TestChildLiveviewEventWeb.ChildEventTest do
  use TestChildLiveviewEventWeb.ConnCase
  import Phoenix.LiveViewTest

  test "click event should be handled by child component", %{conn: conn} do
    {:ok, lv, _html} = live(conn, "/")

    lv
    |> element("#child-component button")
    |> render_click()

    # check message in console
  end
end
