use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :scorecards, ScorecardsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :scorecards, Scorecards.Repo,
  username: "postgres",
  password: "postgres",
  database: "scorecards_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
