class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.integer :user_id
      t.string :name
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
