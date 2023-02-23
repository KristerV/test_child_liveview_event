defmodule TestChildLiveviewEvent.Repo do
  use Ecto.Repo,
    otp_app: :test_child_liveview_event,
    adapter: Ecto.Adapters.Postgres
end
