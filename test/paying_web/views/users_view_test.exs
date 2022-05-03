defmodule PayingWeb.UsersViewTest do
  use PayingWeb.ConnCase, async: true

  import Phoenix.View

  alias Paying.{Account, User}
  alias PayingWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "John Doe",
      password: "secret",
      nickname: "jdoe",
      email: "johndoe@gmail.com",
      age: 21
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Paying.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "John Doe",
        nickname: "jdoe"
      }
    }

    assert expected_response == response
  end
end
