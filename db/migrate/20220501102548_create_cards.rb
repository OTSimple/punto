class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :value
      t.integer :color

      t.timestamps
    end
  end
end
