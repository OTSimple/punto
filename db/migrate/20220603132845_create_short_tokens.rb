class CreateShortTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :short_tokens do |t|
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.string :token

      t.timestamps
    end
  end
end
