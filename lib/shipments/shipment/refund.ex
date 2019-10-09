defmodule Shipments.Shipment.Refund do
  use Ecto.Schema
  import Ecto.Changeset

  schema "refunds" do
    field :address, :string
    field :carrier, :string
    field :cost_center, :string
    field :device_esn, :string
    field :device_model, :string
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(refund, attrs) do
    refund
    |> cast(attrs, [:first_name, :last_name, :address, :cost_center, :carrier, :device_model, :device_esn])
    |> validate_required([:first_name, :last_name, :address, :cost_center, :carrier, :device_model, :device_esn])
  end
end
