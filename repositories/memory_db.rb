require_relative "../model/transaction"

class MemoryDb
  TransactionNotFound = Class.new(StandardError)

  def initialize
    self.store = []
  end

  def all
    store
  end

  def find(uid:)
    transaction = nil

    store.each do |tr|
      transaction = tr if tr.uid == uid
      break if transaction
    end

    raise TransactionNotFound unless transaction
    transaction
  end

  def save(attrs)
    transaction = Transaction.new(client_id: attrs.fetch(:client_id),
                                  sender_iban: attrs.fetch(:sender_iban),
                                  receiver_iban: attrs.fetch(:receiver_iban),
                                  amount: attrs.fetch(:amount),
                                  currency: attrs.fetch(:currency))
    store << transaction
    transaction
  end

  def delete(uid:)
  end

  private

  attr_accessor :store
end
