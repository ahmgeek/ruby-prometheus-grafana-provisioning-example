require_relative "../../repositories/memory_db"

RSpec.describe MemoryDb do
  context "#initialize" do
    subject { MemoryDb.new }

    let(:uid) { "8e8004b8-d91d-4d57-b7a4-605ad926fff7" }
    let(:transaction_attrs) { { uid: uid,
                                client_id: 123456,
                                sender_iban: "AT01020423043204",
                                receiver_iban: "AT01020423043404",
                                amount: 200.23,
                                currency: "EUR" } }
    let(:transaction_model) { Transaction.new(transaction_attrs) }

    it "initializes an empty store" do
      expect(subject).to be_kind_of MemoryDb
    end

    it "saves all transactions" do
      tr  = subject.save(transaction_attrs)

      expect(subject.all).to eq [tr]
    end

    it "saves the correct attributes" do
      result = subject.save(transaction_attrs)
      tr = subject.find(uid: result.uid)


      expect(tr.client_id).to eq transaction_attrs[:client_id]
      expect(tr.sender_iban).to eq transaction_attrs[:sender_iban]
      expect(tr.receiver_iban).to eq transaction_attrs[:receiver_iban]
      expect(tr.amount).to eq transaction_attrs[:amount]
      expect(tr.currency).to eq transaction_attrs[:currency]
    end

    it "returns all transactions"
    it "finds specific transaction"
    it "deletes specific transaction"
  end
end
