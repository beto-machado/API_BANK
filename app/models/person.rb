class Person < ApplicationRecord
  has_many :bank_accounts

  validates :name, :birthdate, :rg, presence: true
  validates :rg, uniqueness: true
end
