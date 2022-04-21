defmodule PayingWeb.FallbackController do
  use PayingWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(PayingWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
