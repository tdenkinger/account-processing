# AccountProcessing

An example application that demostrates concurrent processing of customer
accounts.

## Usage

```
> iex -S mix
```

Pass in the number of accounts to process:

```
AccountProcessing.run(1000)
```

The system will create test data including test credits and debits. It then
calculates the ending balance for the account.

