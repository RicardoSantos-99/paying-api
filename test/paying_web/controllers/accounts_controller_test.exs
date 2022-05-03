defmodule PayingWeb.AccountsControllerTest do
  use PayingWeb.ConnCase
  alias Paying.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "John Doe",
        password: "secret",
        nickname: "jdoe",
        email: "johndoe@gmail.com",
        age: 21
      }

      {:ok, %User{account: %Account{id: account_id}}} = Paying.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic cGF5aW5nOnBheWluZw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{"balance" => "50.00", "id" => _id},
               "message" => "Ballance changed successfully"
             } = response
    end
  end
end
