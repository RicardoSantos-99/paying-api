# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :paying,
  ecto_repos: [Paying.Repo]

# Configures the endpoint
config :paying, PayingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HHHJPDOzGhGF+VIZJ8nORBKElh7kYXha6qffO2q9urzhuBd7ii3IFLo6RoofMJvm",
  render_errors: [view: PayingWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Paying.PubSub,
  live_view: [signing_salt: "b/cwdX9Z"]

config :paying, Paying.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :paying, :basic_auth,
  username: "paying",
  password: "paying"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
