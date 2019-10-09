defmodule Shipments.Repo.Migrations.CreateRefunds do
  use Ecto.Migration

  def change do
    create table(:refunds) do
      add :first_name, :string
      add :last_name, :string
      add :address, :text
      add :cost_center, :string
      add :carrier, :string
      add :device_model, :string
      add :device_esn, :string

      timestamps()
    end

  end
end
