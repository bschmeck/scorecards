defmodule Scorecards.Repo do
  use Ecto.Repo,
    otp_app: :scorecards,
    adapter: Ecto.Adapters.Postgres
end
