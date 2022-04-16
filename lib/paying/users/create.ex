defmodule Paying.Users.Create do
  alias Paying.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
