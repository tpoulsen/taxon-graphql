defmodule Taxon.Repo.Migrations.CreateLeafMargin do
  use Ecto.Migration

  def change do
    create table(:leaf_margins) do
      add :name, :string

      timestamps()
    end

  end
end
