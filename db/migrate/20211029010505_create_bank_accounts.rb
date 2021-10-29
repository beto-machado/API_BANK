class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.references :person, null: false, foreign_key: true
      t.string :account_number, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :bank_accounts, :account_number, unique: true
  end
end
