defmodule Memoir.Repo do
  use Ecto.Repo,
    otp_app: :memoir,
    adapter: Ecto.Adapters.Postgres
end
