class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games, id: :uuid, default: 'gen_random_uuid()' do |t|

      t.timestamps
    end

    add_index :games, :created_at
  end
end
