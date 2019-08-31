# frozen_string_literal: true

require "syro"
require "json"

require_relative "../lib/use_cases/transaction"

# Initializing the business logic object
TransactionService = UseCases::Transaction.new

API = Syro.new do
  get do
    res.write "OK"
  end

  on "transactions" do
    get do
      all_transactions = TransactionService.all

      res.json JSON.dump(all_transactions)
    end

    post do
      attrs = JSON.parse(req.body.read)

      transaction = TransactionService.save(attrs)
      res.json JSON.dump(transaction.to_h)
    end
  end
end
