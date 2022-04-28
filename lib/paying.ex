defmodule Paying do
  alias Paying.Users.Create, as: UserCreate
  alias Paying.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
