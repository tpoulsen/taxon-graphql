defmodule Taxon.Plant do
  alias Taxon.Plant.Plant
  alias Taxon.Plant.LeafShape
  alias Taxon.Plant.LeafMargin
  alias Taxon.Plant.LeafVenation
  alias Taxon.Plant.FruitType
  alias Taxon.Plant.Distribution
  alias Taxon.Repo
  import Ecto.Query

  def make_new(params \\ %{}) do
    %Plant{}
    |> Plant.changeset(params)
    |> Repo.insert
  end
  def make_new!(params \\ %{}) do
    %Plant{}
    |> Plant.changeset(params)
    |> Repo.insert!
  end

  def build_params(%{} = params) do
    %{
      common_name: params.common_name,
      scientific_name: params.scientific_name,
    }
    |> get_leaf_margin(params["leaf_margin"])
    |> get_leaf_venation(params["leaf_venation"])
    |> get_leaf_shape(params["leaf_shape"])
    |> get_fruit_type(params["fruit_type"])
    |> get_distribution(params["distribution"])
  end

  defp get_leaf_margin(s, nil), do: s
  defp get_leaf_margin(s, name) do
    with n <- Repo.get_by(LeafMargin, name: name).id do
      Map.put(s, :leaf_margin_id, n)
    else
      _ -> s
    end
  end

  defp get_leaf_venation(s, nil), do: s
  defp get_leaf_venation(s, name) do
    with id <- Repo.get_by(LeafVenation, name: name).id do
      Map.put(s, :leaf_venation_id, id)
    else
      _ -> s
    end
  end

  defp get_leaf_shape(s, nil), do: s
  defp get_leaf_shape(s, name) do
    with id <- Repo.get_by(LeafShape, name: name).id do
      Map.put(s, :leaf_shape_id, id)
    else
      _ -> s
    end
  end

  defp get_fruit_type(s, nil), do: s
  defp get_fruit_type(s, name) do
    with id <- Repo.get_by(FruitType, name: name).id do
      Map.put(s, :fruit_type_id, id)
    else
      _ -> s
    end
  end

  defp get_distribution(s, nil), do: s
  defp get_distribution(s, name) do
    with id <- Repo.get_by(Distribution, name: name).id do
      Map.put(s, :distribution_id, id)
    else
      _ -> s
    end
  end

  def index do
    Plant
    |> preload
    |> Repo.all
  end

  def destroy(id) do
    id
    |> by_id
    |> Repo.delete
  end

  def by_genus(query, genus) do
    Plant.by_genus(query, genus)
    |> preload
    |> Repo.all
  end

  def by_id(id) do
    Repo.get(Plant, id)
  end

  defp preload(query) do
    from p in query,
    preload: [
      :leaf_shape,
      :leaf_margin,
      :leaf_venation,
      :fruit_type,
      :distribution,
    ]
  end
end
