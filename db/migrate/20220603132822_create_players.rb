class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
