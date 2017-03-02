defmodule Taxon.LeafTypeView do
  use Taxon.Web, :view

  def render("index.json", %{leaf_types: leaf_types}) do
    %{data: render_many(leaf_types, Taxon.LeafTypeView, "leaf_type.json")}
  end

  def render("show.json", %{leaf_type: leaf_type}) do
    %{data: render_one(leaf_type, Taxon.LeafTypeView, "leaf_type.json")}
  end

  def render("leaf_type.json", %{leaf_type: leaf_type}) do
    %{id: leaf_type.id,
      venation: leaf_type.venation,
      shape: leaf_type.shape,
      hairiness: leaf_type.hairiness,
      edge: leaf_type.edge}
  end
end
