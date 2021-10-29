class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :bank_account, null: false
      t.string :kind, null: false
      t.bigint :amount_in_cents, null: false
      t.datetime :transaction_hour, null: false

      t.timestamps
    end

  end
end
