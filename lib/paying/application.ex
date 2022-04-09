defmodule Paying.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Paying.Repo,
      # Start the Telemetry supervisor
      PayingWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Paying.PubSub},
      # Start the Endpoint (http/https)
      PayingWeb.Endpoint
      # Start a worker by calling: Paying.Worker.start_link(arg)
      # {Paying.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Paying.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PayingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
