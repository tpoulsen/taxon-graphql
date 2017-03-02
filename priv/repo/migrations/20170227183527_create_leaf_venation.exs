defmodule Taxon.Repo.Migrations.CreateLeafVenation do
  use Ecto.Migration

  def change do
    create table(:leaf_venation) do
      add :name, :string

      timestamps()
    end

  end
end
