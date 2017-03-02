defmodule Taxon.Schema.Types do
  use Absinthe.Schema.Notation

  @desc "Leaf venation patterns"
  object :leaf_venation do
    field :name, :string
  end

  @desc "Leaf margin types"
  object :leaf_margin do
    field :name, :string
  end

  @desc "Leaf shape types"
  object :leaf_shape do
    field :name, :string
  end

  @desc "Angiosperm fruit types"
  object :fruit_type do
    field :name, :string
  end

  @desc "United States geographic distribution"
  object :distribution do
    field :area, :string
  end

  @desc "A plant"
  object :plant do
    field :id, :id
    field :common_name, :string, description: "The plant's common name"
    field :scientific_name, :string, description: "The scientific name (Genus species) for the plant"
    field :leaf_shape, :leaf_shape, description: "The general shape of a leaf"
    field :leaf_margin, :leaf_margin, description: "The characteristics of the edge of a leaf"
    field :leaf_venation, :leaf_venation, description: "The pattern of the veins inside a leaf"
    field :fruit_type, :fruit_type, description: "The type of botanical fruit; contains the seeds"
    field :distribution, :distribution, description: "Where in the U.S. the plant can be found"
  end
end
