class AddTimeToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :timer, :integer
  end
end
