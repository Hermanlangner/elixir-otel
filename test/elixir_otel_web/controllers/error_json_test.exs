defmodule ElixirOtelWeb.ErrorJSONTest do
  use ElixirOtelWeb.ConnCase, async: true

  test "renders 404" do
    assert ElixirOtelWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ElixirOtelWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
