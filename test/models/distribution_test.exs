defmodule Taxon.DistributionTest do
  use Taxon.ModelCase

  alias Taxon.Distribution

  @valid_attrs %{area: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Distribution.changeset(%Distribution{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Distribution.changeset(%Distribution{}, @invalid_attrs)
    refute changeset.valid?
  end
end
