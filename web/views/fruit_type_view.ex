defmodule Taxon.FruitTypeView do
  use Taxon.Web, :view

  def render("index.json", %{fruit_types: fruit_types}) do
    %{data: render_many(fruit_types, Taxon.FruitTypeView, "fruit_type.json")}
  end

  def render("show.json", %{fruit_type: fruit_type}) do
    %{data: render_one(fruit_type, Taxon.FruitTypeView, "fruit_type.json")}
  end

  def render("fruit_type.json", %{fruit_type: fruit_type}) do
    %{id: fruit_type.id,
      name: fruit_type.name}
  end
end
