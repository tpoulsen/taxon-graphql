defmodule Taxon.Plant.Plant do
  alias Taxon.Plant
  use Taxon.Web, :model

  schema "plants" do
    field :common_name, :string
    field :scientific_name, :string
    belongs_to :leaf_shape, Plant.LeafShape
    belongs_to :leaf_margin, Plant.LeafMargin
    belongs_to :leaf_venation, Plant.LeafVenation
    belongs_to :fruit_type, Plant.FruitType
    belongs_to :distribution, Plant.Distribution

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:common_name, :scientific_name, :leaf_shape_id, :leaf_margin_id, :leaf_venation_id, :fruit_type_id, :distribution_id])
    |> validate_required([:common_name, :scientific_name])
  end

  def by_genus(query, genus) do
    from p in query,
      where: ilike(p.scientific_name, ^"#{genus}%")
  end

end
