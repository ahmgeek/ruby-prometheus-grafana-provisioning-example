require 'securerandom'
require 'json'

class Transaction
  attr_reader :uid, :client_id, :sender_iban, :receiver_iban, :amount, :currency

  def initialize(uid: SecureRandom.uuid, client_id:, sender_iban:, receiver_iban:, amount:, currency:)
    @uid            = uid
    @client_id      = client_id
    @sender_iban    = sender_iban
    @receiver_iban  = receiver_iban
    @amount         = amount
    @currency       = currency
  end

  def to_h
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
