class AddBalanceToBankAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :bank_accounts, :balance_in_cents, :bigint
  end
end
