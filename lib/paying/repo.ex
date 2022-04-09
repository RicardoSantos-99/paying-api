defmodule Paying.Repo do
  use Ecto.Repo,
    otp_app: :paying,
    adapter: Ecto.Adapters.Postgres
end
