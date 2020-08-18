# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :memoir,
  ecto_repos: [Memoir.Repo]

# Configures the endpoint
config :memoir, MemoirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BZ3e0M5lQIQLBZjOcADEpjymmpuZltM1RsldHiCIigjzXFo4eoPfa6GEUCytTUm9",
  render_errors: [view: MemoirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Memoir.PubSub,
  live_view: [signing_salt: "CkX+DRhM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
