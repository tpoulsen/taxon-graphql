defmodule Taxon.Repo.Migrations.CreateFruitType do
  use Ecto.Migration

  def change do
    create table(:fruit_types) do
      add :name, :string

      timestamps()
    end

  end
end
