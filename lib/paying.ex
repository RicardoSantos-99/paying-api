defmodule Paying do
  alias Paying.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
