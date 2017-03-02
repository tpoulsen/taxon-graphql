defmodule Taxon.Resolver.Plant do
  alias Taxon.Plant

  def plants(%{genus: genus}, _context) do
    plants = Plant.Plant
    |> Plant.by_genus(genus)
    {:ok, plants}
  end
  def plants(_args, _context) do
    {:ok, Plant.index}
  end

  def mutate_plant(%{} = params, _context) do
    with params <- Plant.build_params(params),
         {:ok, plant} <- Plant.make_new(params) do
      {:ok, plant}
    else
      _ -> {:error, "Unable to make new plant"}
    end
  end

  def destroy_plant(%{id: id} = params, _context) do
    with plant <- Plant.by_id(id),
         {:ok, plant} <- Plant.destroy(id) do
      {:ok, "Deleted #{plant.common_name} (#{plant.scientific_name})"}
    else
      _ -> {:error, "Unable to make new plant"}
    end
  end
end
