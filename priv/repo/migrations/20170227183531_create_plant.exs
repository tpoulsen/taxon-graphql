defmodule Taxon.Repo.Migrations.CreatePlant do
  use Ecto.Migration

  def change do
    create table(:plants) do
      add :common_name, :string
      add :scientific_name, :string
      add :leaf_margin_id, references(:leaf_margins, on_delete: :nothing)
      add :leaf_shape_id, references(:leaf_shapes, on_delete: :nothing)
      add :leaf_venation_id, references(:leaf_venation, on_delete: :nothing)
      add :fruit_type_id, references(:fruit_types, on_delete: :nothing)
      add :distribution_id, references(:distributions, on_delete: :nothing)

      timestamps()
    end
    create index(:plants, [:leaf_margin_id])
    create index(:plants, [:leaf_shape_id])
    create index(:plants, [:leaf_venation_id])
    create index(:plants, [:fruit_type_id])
    create index(:plants, [:distribution_id])

  end
end
