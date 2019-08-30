require 'securerandom'

class Transaction
  attr_reader :client_id, :sender_iban, :receiver_iban, :amount, :currency

  def initialize(client_id:, sender_iban:, receiver_iban:, amount:, currency:)
    @uid            = SecureRandom.uuid
    @client_id      = client_id
    @sender_iban    = sender_iban
    @receiver_iban  = receiver_iban
    @amount         = amount
    @currency       = currency
  end

  def transactions
    {
      uid: @uid,
      client_id: @client_id,
      sender_iban: @sender_iban,
      receiver_iban: @receiver_iban,
      amount: @amount,
      currency: @currency
    }
  end
end
