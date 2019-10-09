defmodule ShipmentsWeb.RefundController do
  use ShipmentsWeb, :controller

  alias Shipments.Shipment
  alias Shipments.Shipment.Refund

  def index(conn, _params) do
    refunds = Shipment.list_refunds()
    render(conn, "index.html", refunds: refunds)
  end

  def new(conn, _params) do
    changeset = Shipment.change_refund(%Refund{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"refund" => refund_params}) do
    case Shipment.create_refund(refund_params) do
      {:ok, refund} ->
        conn
        |> put_flash(:info, "Refund created successfully.")
        |> redirect(to: Routes.refund_path(conn, :show, refund))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    refund = Shipment.get_refund!(id)
    render(conn, "show.html", refund: refund)
  end
end
