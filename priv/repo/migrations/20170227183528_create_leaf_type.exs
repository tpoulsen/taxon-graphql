defmodule Taxon.Repo.Migrations.CreateLeafType do
  use Ecto.Migration

  def change do
    create table(:leaf_types) do
      add :venation, :string
      add :shape, :string
      add :hairiness, :string
      add :edge, :string

      timestamps()
    end

  end
end
