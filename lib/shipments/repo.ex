defmodule Shipments.Repo do
  use Ecto.Repo,
    otp_app: :shipments,
    adapter: Ecto.Adapters.Postgres
end
