class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.timestamps
      t.integer :host_player_id
      t.integer :opponent_player_id
      t.index :host_player_id
      t.index :opponent_player_id
      t.boolean :winner_id
    end
  end
end
