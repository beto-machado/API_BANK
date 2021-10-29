class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.date :birthdate, null: false
      t.string :cpf_photo
      t.string :rg, null: false

      t.timestamps
    end
    add_index :people, :rg, unique: true
  end
end
