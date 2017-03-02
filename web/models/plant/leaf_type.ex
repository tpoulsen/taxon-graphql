defmodule Taxon.Plant.LeafType do
  use Taxon.Web, :model

  schema "leaf_types" do
    field :venation, :string
    field :shape, :string
    field :hairiness, :string
    field :edge, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:venation, :shape, :hairiness, :edge])
    |> validate_required([:venation, :shape, :hairiness, :edge])
  end
end
