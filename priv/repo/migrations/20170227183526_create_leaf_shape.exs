defmodule Taxon.Repo.Migrations.CreateLeafShape do
  use Ecto.Migration

  def change do
    create table(:leaf_shapes) do
      add :name, :string

      timestamps()
    end

  end
end
