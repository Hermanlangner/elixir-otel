defmodule ElixirOtel.Repo do
  use Ecto.Repo,
    otp_app: :elixir_otel,
    adapter: Ecto.Adapters.Postgres
end
