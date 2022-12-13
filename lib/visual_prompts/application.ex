defmodule VisualPrompts.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      VisualPromptsWeb.Telemetry,
      # Start the Ecto repository
      VisualPrompts.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: VisualPrompts.PubSub},
      # Start Finch
      {Finch, name: VisualPrompts.Finch},
      # Start the Endpoint (http/https)
      VisualPromptsWeb.Endpoint
      # Start a worker by calling: VisualPrompts.Worker.start_link(arg)
      # {VisualPrompts.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VisualPrompts.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VisualPromptsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
