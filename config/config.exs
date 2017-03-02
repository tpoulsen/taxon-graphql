# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :taxon,
  ecto_repos: [Taxon.Repo]

# Configures the endpoint
config :taxon, Taxon.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+KokO6zcA6juvVJG77/+S40kYOhl1bGj+PJ88eHjsTzAb198rJC7HY9pgtL1MGCb",
  render_errors: [view: Taxon.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Taxon.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
