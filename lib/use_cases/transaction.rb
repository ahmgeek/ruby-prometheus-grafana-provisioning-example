# frozen_string_literal: true

require_relative "../repositories/memory_db"

module UseCases
  class Transaction
    def initialize
      self.store = MemoryDb.new
    end

    def all
      store.all.map(&:to_h)
    end

    def save(transaction)
      store.save(transaction)
    end

    def update(uid:, attr:)
      store.update(uid: uid, attr: attr)
    end

    def find(uid:)
      store.find(uid: uid)
    end

    def delete(uid:)
      store.delete(uid: uid)
    end

    private

    attr_accessor :store
  end
end
