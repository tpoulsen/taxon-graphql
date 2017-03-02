defmodule Taxon.PlantView do
  use Taxon.Web, :view

  def render("index.json", %{plants: plants}) do
    %{data: render_many(plants, Taxon.PlantView, "plant.json")}
  end

  def render("show.json", %{plant: plant}) do
    %{data: render_one(plant, Taxon.PlantView, "plant.json")}
  end

  def render("plant.json", %{plant: plant}) do
    %{id: plant.id,
      common_name: plant.common_name,
      scientific_name: plant.scientific_name,
      leaf_type: plant.leaf_type,
      fruit_type: plant.fruit_type,
      distribution: plant.distribution}
  end
end
