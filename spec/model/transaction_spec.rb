# frozen_string_literal: true

require_relative "../../models/transaction"

RSpec.describe Transaction do
  context "#initialize" do
    let(:transaction) { build(:transaction, uid: uid) }
    let(:uid) { "123-654-abc" }
    let(:to_h) do
      {
        uid:           transaction.uid,
        sender_iban:   transaction.sender_iban,
        receiver_iban: transaction.receiver_iban,
        currency:      transaction.currency,
        amount:        transaction.amount,
        client_id:     transaction.client_id
      }
    end

    it "initializes Transaction correctly" do
      expect { transaction }.not_to raise_error
    end

    it "initializes correct class" do
      expect(transaction).to be_a Transaction
    end

    it "raises error with missing sender_iban" do
      attr = transaction.to_h
      attr.delete(:sender_iban)

      expect { Transaction.new(transaction: attr) }.to raise_error(/sender_iban/)
    end

    it "returns correct hash" do
      expect(transaction.to_h).to eq to_h
    end
  end
end
