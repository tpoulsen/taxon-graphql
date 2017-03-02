defmodule Taxon.LeafTypeTest do
  use Taxon.ModelCase

  alias Taxon.LeafType

  @valid_attrs %{edge: "some content", hairiness: "some content", shape: "some content", venation: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LeafType.changeset(%LeafType{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LeafType.changeset(%LeafType{}, @invalid_attrs)
    refute changeset.valid?
  end
end
