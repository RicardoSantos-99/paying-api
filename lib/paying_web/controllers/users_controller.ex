defmodule PayingWeb.UsersController do
  use PayingWeb, :controller

  alias Paying.User

  action_fallback PayingWeb.FallbackController

  def create(conn, params) do
    params
    |> Paying.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, _result} = error, _conn), do: error
end
