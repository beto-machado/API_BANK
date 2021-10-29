class BankAccount < ApplicationRecord
  belongs_to :person
  has_many :transactions

  validates :person_id, :account_number, :password_digest, presence: true
  validates :account_number, uniqueness: true

  ACCOUNT_NUMBER_LIMIT = 9_999
  TEMP_PASSWORD = "123456"

  def self.initialize_account
    account_number = generate_account_number

    self.new(account_number: account_number, password_digest: TEMP_PASSWORD, balance_in_cents: 0)
  end

  def calculate_balance
    balance_in_cents =
      transactions.order(:transaction_hour).inject(0) do |balance, transaction|
        if transaction.kind == 'C'
          balance + transaction.amount_in_cents
        else
          balance - transaction.amount_in_cents
        end
      end
    amount, cents = "#{balance_in_cents / 100.0}"

    "R$ #{amount}#{cents}"
    end

  private

  def self.generate_account_number
    next_account_number = self.count(1) + 1

    digit_number = next_account_number / ACCOUNT_NUMBER_LIMIT
    account_number =
      if next_account_number > ACCOUNT_NUMBER_LIMIT
        1
      else
        next_account_number
      end
    "#{account_number.to_s.rjust(4, "0")}-#{digit_number}"
  end
end
