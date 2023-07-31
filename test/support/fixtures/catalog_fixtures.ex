defmodule ElixirOtel.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirOtel.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title",
        price: "120.5",
        views: 42
      })
      |> ElixirOtel.Catalog.create_product()

    product
  end
end
