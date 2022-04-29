defmodule PayingWeb.AccountsController do
  use PayingWeb, :controller

  alias Paying.Account

  action_fallback PayingWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Paying.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Paying.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
