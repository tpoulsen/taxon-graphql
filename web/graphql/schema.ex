defmodule Taxon.Schema do
  use Absinthe.Schema

  import_types Taxon.Schema.Types

  query do
    field :plants, list_of(:plant) do
      arg :genus, :string, description: "Search by genus name"
      resolve &Taxon.Resolver.Plant.plants/2
    end
  end

  mutation do
    field :plant, :plant do
      arg :leaf_shape, :string
      arg :leaf_venation, :string
      arg :leaf_margin, :string
      arg :fruit_type, :string
      arg :distribution, :string
      arg :common_name, :string
      arg :scientific_name, :string
      resolve &Taxon.Resolver.Plant.mutate_plant/2
    end

    field :destroy_plant, :string do
      arg :id, :integer
      resolve &Taxon.Resolver.Plant.destroy_plant/2
    end
  end
end
