class Question < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  belongs_to :game
end
