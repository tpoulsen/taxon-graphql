defmodule Taxon.Plant.Distribution do
  use Taxon.Web, :model

  schema "distributions" do
    field :area, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:area])
    |> validate_required([:area])
  end
end
