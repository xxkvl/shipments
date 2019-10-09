defmodule Shipments.ShipmentTest do
  use Shipments.DataCase

  alias Shipments.Shipment

  describe "refunds" do
    alias Shipments.Shipment.Refund

    @valid_attrs %{address: "some address", carrier: "some carrier", cost_center: "some cost_center", device_esn: "some device_esn", device_model: "some device_model", first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{address: "some updated address", carrier: "some updated carrier", cost_center: "some updated cost_center", device_esn: "some updated device_esn", device_model: "some updated device_model", first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{address: nil, carrier: nil, cost_center: nil, device_esn: nil, device_model: nil, first_name: nil, last_name: nil}

    def refund_fixture(attrs \\ %{}) do
      {:ok, refund} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipment.create_refund()

      refund
    end

    test "list_refunds/0 returns all refunds" do
      refund = refund_fixture()
      assert Shipment.list_refunds() == [refund]
    end

    test "get_refund!/1 returns the refund with given id" do
      refund = refund_fixture()
      assert Shipment.get_refund!(refund.id) == refund
    end

    test "create_refund/1 with valid data creates a refund" do
      assert {:ok, %Refund{} = refund} = Shipment.create_refund(@valid_attrs)
      assert refund.address == "some address"
      assert refund.carrier == "some carrier"
      assert refund.cost_center == "some cost_center"
      assert refund.device_esn == "some device_esn"
      assert refund.device_model == "some device_model"
      assert refund.first_name == "some first_name"
      assert refund.last_name == "some last_name"
    end

    test "create_refund/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipment.create_refund(@invalid_attrs)
    end

    test "update_refund/2 with valid data updates the refund" do
      refund = refund_fixture()
      assert {:ok, %Refund{} = refund} = Shipment.update_refund(refund, @update_attrs)
      assert refund.address == "some updated address"
      assert refund.carrier == "some updated carrier"
      assert refund.cost_center == "some updated cost_center"
      assert refund.device_esn == "some updated device_esn"
      assert refund.device_model == "some updated device_model"
      assert refund.first_name == "some updated first_name"
      assert refund.last_name == "some updated last_name"
    end

    test "update_refund/2 with invalid data returns error changeset" do
      refund = refund_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipment.update_refund(refund, @invalid_attrs)
      assert refund == Shipment.get_refund!(refund.id)
    end

    test "delete_refund/1 deletes the refund" do
      refund = refund_fixture()
      assert {:ok, %Refund{}} = Shipment.delete_refund(refund)
      assert_raise Ecto.NoResultsError, fn -> Shipment.get_refund!(refund.id) end
    end

    test "change_refund/1 returns a refund changeset" do
      refund = refund_fixture()
      assert %Ecto.Changeset{} = Shipment.change_refund(refund)
    end
  end
end
