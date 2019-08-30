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

    let(:unique_transaction) do
      tr = transaction_attrs.clone
      tr.delete(:uid)
      tr
    end

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


    it "finds specific transaction" do
      expect { subject.find(uid: "foo") }.to raise_error
    end

    it "deletes specific transaction"

    it "returns all transactions" do
      3.times { subject.save(unique_transaction) }

      expect(subject.all.size).to be 3
    end

    it "stores only unique transactions" do
      tr_1 = tr_2 = transaction_attrs
      subject.save(tr_1)

      expect { subject.save(tr_2) }.not_to raise_error
    end
  end
end
