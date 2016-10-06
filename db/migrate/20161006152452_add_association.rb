class AddAssociation < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :user_id, :integer
    add_column :users, :card_id, :integer
  end
end
