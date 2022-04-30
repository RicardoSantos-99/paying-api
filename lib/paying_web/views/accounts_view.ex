defmodule PayingWeb.AccountsView do
  alias Paying.Account

  def render("update.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Ballance changed successfully",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{
        transaction: %{
          to_account: %Account{id: to_account_id, balance: to_balance},
          from_account: %Account{id: from_account_id, balance: from_balance}
        }
      }) do
    %{
      message: "Transaction completed successfully",
      transaction: %{
        from_account: %{
          id: from_account_id,
          balance: from_balance
        },
        to_account: %{
          id: to_account_id,
          balance: to_balance
        }
      }
    }
  end
end
