# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :catcasts,
  ecto_repos: [Catcasts.Repo]

# Configures the endpoint
config :catcasts, Catcasts.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q3aUkSgplGN1khY33lh4K0UFid+mAB9FojumOq8alKZaVx3Oe3v9lU3kPkjooRO6",
  render_errors: [view: Catcasts.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Catcasts.PubSub,
           adapter: Phoenix.PubSub.PG2]


 # Configure Google OAuth
 config :ueberauth, Ueberauth,
   providers: [
     google: {Ueberauth.Strategy.Google, [default_scope: "emails profile plus.me"]}
   ]
 config :ueberauth, Ueberauth.Strategy.Google.OAuth,
   client_id: System.get_env("GOOGLE_CLIENT_ID"),
   client_secret: System.get_env("GOOGLE_CLIENT_SECRET")


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
