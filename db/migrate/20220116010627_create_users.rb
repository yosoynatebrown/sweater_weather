# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :api_key

      t.timestamps
    end
    add_index :users, :api_key, unique: true
  end
end
