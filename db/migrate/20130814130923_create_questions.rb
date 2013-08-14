class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :value
      t.integer :game_id
      t.index :user_id
      t.index :game_id

      t.timestamps
    end
  end
end
