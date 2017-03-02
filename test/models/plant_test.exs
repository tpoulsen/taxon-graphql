defmodule Taxon.PlantTest do
  use Taxon.ModelCase

  alias Taxon.Plant

  @valid_attrs %{common_name: "some content", scientific_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Plant.changeset(%Plant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Plant.changeset(%Plant{}, @invalid_attrs)
    refute changeset.valid?
  end
end
