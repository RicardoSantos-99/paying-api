defmodule PayingWeb.UsersController do
  use PayingWeb, :controller

  alias Paying.User

  action_fallback PayingWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Paying.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
