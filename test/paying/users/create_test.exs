defmodule Paying.Users.CreateTest do
  use Paying.DataCase

  alias Paying.User
  alias Paying.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "John Doe",
        password: "secret",
        nickname: "jdoe",
        email: "johndoe@gmail.com",
        age: 21
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      IO.inspect(user)

      assert %User{name: "John Doe", age: 21, id: ^user_id} = user
    end

    test "when there are invalid, returns an error" do
      params = %{
        name: "John Doe",
        # password: "secret",
        nickname: "jdoe",
        email: "johndoe@gmail.com",
        age: 11
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
