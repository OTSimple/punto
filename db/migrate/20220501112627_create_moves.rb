class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.references :card, null: false, foreign_key: true
      t.integer :coordinates, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :moves, :coordinates, using: :gin
  end
end
