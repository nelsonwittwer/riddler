class Game < ActiveRecord::Base
  ##
  # Associations
  #
  has_many :questions
  belongs_to :host_player, :class_name => "User", :foreign_key => "host_player_id"
  belongs_to :opponent_player, :class_name => "User", :foreign_key => "opponent_player_id"
end
