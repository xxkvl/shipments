defmodule Shipments.Shipment do
  import Ecto.Query, warn: false
  alias Shipments.Repo

  alias Shipments.Shipment.Refund

  def list_refunds do
    Repo.all(Refund)
  end

  def get_refund!(id), do: Repo.get!(Refund, id)

  def create_refund(attrs \\ %{}) do
    %Refund{}
    |> Refund.changeset(attrs)
    |> Repo.insert()
  end

  def change_refund(%Refund{} = refund) do
    Refund.changeset(refund, %{})
  end
end
