# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Taxon.Repo.insert!(%Taxon.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Taxon.Plant.Plant
alias Taxon.Plant.LeafShape
alias Taxon.Plant.LeafMargin
alias Taxon.Plant.LeafVenation
alias Taxon.Plant.FruitType
alias Taxon.Plant.Distribution
alias Taxon.Repo

[
  %{name: "circular"},
  %{name: "cordate"},
  %{name: "elliptical"},
  %{name: "lance"},
  %{name: "linear"},
  %{name: "oval"},
  %{name: "ovate"},
  %{name: "triangular"},
]
|> Enum.each(fn shape ->
  %LeafShape{}
  |> LeafShape.changeset(shape)
  |> Repo.insert!
end)

[
  %{name: "doubly serrate"},
  %{name: "entire"},
  %{name: "lobed"},
  %{name: "serrate"},
  %{name: "wavy"},
]
|> Enum.each(fn margin ->
  %LeafMargin{}
  |> LeafMargin.changeset(margin)
  |> Repo.insert!
end)

[
  %{name: "palmate"},
  %{name: "parallel"},
  %{name: "pinnate"},
  %{name: "reticulate"},
]
|> Enum.each(fn venation ->
  %LeafVenation{}
  |> LeafVenation.changeset(venation)
  |> Repo.insert!
end)

[
  %{name: "accessory"},
  %{name: "aggregate"},
  %{name: "berry"},
  %{name: "drupe"},
  %{name: "hesperidium"},
  %{name: "multiple"},
  %{name: "nut"},
  %{name: "pepo"},
  %{name: "pome"},
  %{name: "samara"},
]
|> Enum.each(fn fruit ->
  %FruitType{}
  |> FruitType.changeset(fruit)
  |> Repo.insert!
end)

[
  %{area: "Eastern, U.S."},
  %{area: "Midwest, U.S."},
  %{area: "New England, U.S."},
  %{area: "Pacific Northwest, U.S."},
  %{area: "Pacific coast, U.S."},
  %{area: "Southwest, U.S."},
  %{area: "U.S."},
]
|> Enum.each(fn distribution ->
  %Distribution{}
  |> Distribution.changeset(distribution)
  |> Repo.insert!
end)

[
  %{
    common_name: "Scarlet Oak",
    scientific_name: "Quercus coccinea",
    leaf_shape_id: Repo.get_by(LeafShape, name: "ovate").id,
    leaf_margin_id: Repo.get_by(LeafMargin, name: "lobed").id,
    leaf_venation_id: Repo.get_by(LeafVenation, name: "pinnate").id,
    fruit_type_id: Repo.get_by(FruitType, name: "nut").id,
    distribution_id: Repo.get_by(Distribution, area: "U.S.").id,
  },
  %{
    common_name: "Blackjack Oak",
    scientific_name: "Quercus marilandica",
    leaf_shape_id: Repo.get_by(LeafShape, name: "ovate").id,
    leaf_margin_id: Repo.get_by(LeafMargin, name: "lobed").id,
    leaf_venation_id: Repo.get_by(LeafVenation, name: "pinnate").id,
    fruit_type_id: Repo.get_by(FruitType, name: "nut").id,
    distribution_id: Repo.get_by(Distribution, area: "Eastern, U.S.").id,
  },
  %{
    common_name: "Wild strawberry",
    scientific_name: "Fragaria vesca",
    leaf_shape_id: Repo.get_by(LeafShape, name: "ovate").id,
    leaf_margin_id: Repo.get_by(LeafMargin, name: "serrate").id,
    leaf_venation_id: Repo.get_by(LeafVenation, name: "pinnate").id,
    fruit_type_id: Repo.get_by(FruitType, name: "accessory").id,
    distribution_id: Repo.get_by(Distribution, area: "U.S.").id,
  }
]
|> Enum.each(fn distribution ->
  %Plant{}
  |> Plant.changeset(distribution)
  |> Repo.insert!
end)
