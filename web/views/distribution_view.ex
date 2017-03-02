defmodule Taxon.DistributionView do
  use Taxon.Web, :view

  def render("index.json", %{distributions: distributions}) do
    %{data: render_many(distributions, Taxon.DistributionView, "distribution.json")}
  end

  def render("show.json", %{distribution: distribution}) do
    %{data: render_one(distribution, Taxon.DistributionView, "distribution.json")}
  end

  def render("distribution.json", %{distribution: distribution}) do
    %{id: distribution.id,
      area: distribution.area}
  end
end
