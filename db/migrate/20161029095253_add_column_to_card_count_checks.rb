class AddColumnToCardCountChecks < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :count_checks, :integer, default: 0
    add_column :cards, :count_errors, :integer, default: 0
  end
end
