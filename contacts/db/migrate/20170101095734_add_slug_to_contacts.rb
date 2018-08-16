# frozen_string_literal: true
class AddSlugToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :slug, :string, unique: true
    remove_index :contacts, :user_id
    add_index :contacts, :user_id
  end
end
