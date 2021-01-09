# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :to_do_list,
  ecto_repos: [ToDoList.Repo]

# Configures the endpoint
config :to_do_list, ToDoListWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8ZS6XAihAbe1Hs7TsKzAG3Iy4hoIQ4RYcg10swwY8+YrEzsF5vGGglCDeClvGQjm",
  render_errors: [view: ToDoListWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ToDoList.PubSub,
  live_view: [signing_salt: "ra9txPrK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
