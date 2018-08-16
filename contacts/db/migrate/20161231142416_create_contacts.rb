# frozen_string_literal: true
class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :address
      t.date :birthday
      t.string :circle
      t.integer :user_id
      t.timestamps
    end
    add_index :contacts, :user_id, unique: true
  end
end
