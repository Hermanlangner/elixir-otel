defmodule ElixirOtelWeb.HelloController do
  use ElixirOtelWeb, :controller
  use PhoenixSwagger

  def swagger_definitions do
    %{
      "Messenger" => %{
        type: "object",
        properties: %{
          name: %{type: "string"},
          message: %{type: "string"}
        }
      }
    }
  end

  # open api spec for this controller call
  swagger_path(:index) do
    get("/hello")
    summary("List Messengers")
    description("List all messengers in the database")
    produces("text/html")
    deprecated(false)

    response(200, "OK", Schema.ref(:MessengersResponse),
      example: %{
        data: [
          %{
            id: 1,
            name: "Joe",
            message: "Hello World",
            inserted_at: "2017-02-08T12:34:55Z",
            updated_at: "2017-02-12T13:45:23Z"
          },
          %{
            id: 2,
            name: "Jack",
            message: "Hello World",
            inserted_at: "2017-02-04T11:24:45Z",
            updated_at: "2017-02-15T23:15:43Z"
          }
        ]
      }
    )
  end

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, :index)
  end

  swagger_path(:show) do
    get("/hello/:messenger")
    summary("List Users")
    description("List all users in the database")
    produces("text/html")
    deprecated(false)

    response(200, "OK", Schema.ref(:UsersResponse),
      example: %{
        data: [
          %{
            id: 1,
            name: "Joe",
            email: "Joe6@mail.com",
            inserted_at: "2017-02-08T12:34:55Z",
            updated_at: "2017-02-12T13:45:23Z"
          },
          %{
            id: 2,
            name: "Jack",
            email: "Jack7@mail.com",
            inserted_at: "2017-02-04T11:24:45Z",
            updated_at: "2017-02-15T23:15:43Z"
          }
        ]
      }
    )
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: messenger)
  end
end
