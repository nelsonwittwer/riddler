class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :facebook_uid
      t.string :facebook_name
      t.string :profile_picture_url
      t.boolean :ruled_out_by_host_player
      t.boolean :ruled_out_by_opponent_player
      t.boolean :answer_of_host_player
      t.boolean :answer_of_opponent_player
      t.integer :game_id
      t.index :game_id

      t.timestamps
    end
  end
end
