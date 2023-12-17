defmodule Portfolio.Project do
  @moduledoc false

  @enforce_keys [:name, :description, :category]
  defstruct [:name, :description, :repo_uri, :visit_uri, :image, :category, technologies: []]

  def build(filename, attrs, body) do
    struct!(
      __MODULE__,
      [description: body, category: get_category(filename)] ++ Map.to_list(attrs)
    )
  end

  defp get_category(filename), do: filename |> Path.dirname() |> Path.basename()
end
