class CreateRounds < ActiveRecord::Migration[7.1]
  def change
    create_table :rounds do |t|
      t.references :game, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true
      t.integer :attempts

      t.timestamps
    end
  end
end
