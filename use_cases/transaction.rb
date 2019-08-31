# frozen_string_literal: true

require_relative "../repositories/memory_db"

module UseCases
  class Transaction
    DB = MemoryDb.new

    class << self
      def all
        DB.all
      end

      def save(transaction)
        DB.save(transaction)
      end

      def update(uid:, attr:)
        DB.update(uid: uid, attr: attr)
      end

      def find(uid:)
        DB.find(uid: uid)
      end

      def delete(uid:)
        DB.delete(uid: uid)
      end
    end
  end
end
