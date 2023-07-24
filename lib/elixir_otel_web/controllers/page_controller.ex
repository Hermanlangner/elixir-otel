defmodule ElixirOtelWeb.PageController do
  use ElixirOtelWeb, :controller

  plug :put_view, html: ElixirOtelWeb.PageHTML, json: ElixirOtelWeb.PageJSON

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    conn
    # |> put_flash(:error, "Let's pretend we have an error.")
    # |> redirect(to: ~p"/redirect_test")
    |> put_layout(html: :admin)
    |> render(:home)
  end

  def redirect_home(conn, _params) do
    redirect(conn, to: ~p"/redirect_test")
  end

  def redirect_test(conn, _params) do
    render(conn, :home, layout: false)
  end
end
