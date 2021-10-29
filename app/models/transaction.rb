class Transaction < ApplicationRecord
  belongs_to :bank_account

  validates :kind, :amount_in_cents, :transaction_hour, presence: true
  validates :kind, inclusion: ['C', 'D']

  def formatted_amount
    amount, cents = "#{amount_in_cents / 100.0}".split(",")

    "R$ #{amount},#{cents}"
  end
end
