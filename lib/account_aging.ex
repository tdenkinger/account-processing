defmodule AccountProcessing do
  def run(customer_count) do
    parent = self

    1..customer_count
    |> Accounts.gather_accounts
    |> Enum.map(fn (customer) ->
         spawn_link fn -> (send parent, { self, process(customer) }) end
       end)
    |> Enum.map(fn (pid) ->
         receive do { ^pid, result } -> result end
       end)
  end

  defp process(customer) do
    id = customer[:id]
    name = customer[:name]
    balance = compute_balance(customer[:credits], customer[:debits])

    %{id: id, name: name, balance: balance}
  end

  defp compute_balance(credits, debits) do
    sum(credits) - sum(debits)
  end

  defp sum(values) do
    Enum.reduce(values, 0.00, fn(entry, acc) -> entry + acc end)
  end
end

