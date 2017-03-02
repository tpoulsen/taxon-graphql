defmodule Taxon.Repo.Migrations.CreateDistribution do
  use Ecto.Migration

  def change do
    create table(:distributions) do
      add :area, :string

      timestamps()
    end

  end
end
