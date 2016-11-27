class AddEfactorAndCounterAndRemoveColumnsCheckAndErrors < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :efactor, :float, default: 2.5
    add_column :cards, :counter, :integer, default:1
    remove_column :cards, :count_checks, :integer
    remove_column :cards, :count_errors, :integer
  end
end
