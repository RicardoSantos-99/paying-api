defmodule PayingWeb.AccountsController do
  use PayingWeb, :controller

  alias Paying.Account
  alias Paying.Accounts.Transactions.Response, as: TransactionResponse

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

  def transaction(conn, params) do
    task = Task.async(fn -> Paying.transaction(params) end)

    with {:ok, %TransactionResponse{} = transaction} <- Task.await(task) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
