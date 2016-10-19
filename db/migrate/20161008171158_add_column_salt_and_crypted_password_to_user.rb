class AddColumnSaltAndCryptedPasswordToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :salt, :string
    add_column :users, :crypted_password, :string
  end
end
