defmodule Accounts do
  def gather_accounts(customer_count) do
    customer_count
    |> Enum.map(fn(id) -> %{id: id,
                            name: "Customer#{id}",
                            credits: create_transactions,
                            debits:  create_transactions
                          }
    end)
  end

  defp create_transactions do
    1..:rand.uniform(20) |> Enum.map(fn(_) -> :rand.uniform(10000) end)
  end

end

