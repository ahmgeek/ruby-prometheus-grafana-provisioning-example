require "syro"
require "json"

require_relative "../repositories/memory_db"

DB = MemoryDb.new

API = Syro.new do
  on "transactions" do
    get do
      res[Rack::CONTENT_TYPE] = "application/json"
      all_transactions = TransactionService.all

      res.json JSON.dump(all_transactions.map(&:to_h))
    end

    post do
      attrs = JSON.parse(req.body.read)

      transaction = TransactionService.save(attrs)
      res.json JSON.dump(transaction.to_h)
    end
  end
end


class TransactionService
  def self.all
    DB.all
  end

  def self.save(attrs)
    DB.save(attrs)
  end
end
