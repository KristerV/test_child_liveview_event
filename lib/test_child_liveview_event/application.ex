defmodule TestChildLiveviewEvent.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TestChildLiveviewEventWeb.Telemetry,
      # Start the Ecto repository
      TestChildLiveviewEvent.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestChildLiveviewEvent.PubSub},
      # Start Finch
      {Finch, name: TestChildLiveviewEvent.Finch},
      # Start the Endpoint (http/https)
      TestChildLiveviewEventWeb.Endpoint
      # Start a worker by calling: TestChildLiveviewEvent.Worker.start_link(arg)
      # {TestChildLiveviewEvent.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestChildLiveviewEvent.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestChildLiveviewEventWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
