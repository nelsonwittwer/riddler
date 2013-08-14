require 'factory_girl'

FactoryGirl.define do
  factory :user, aliases: [:host_player, :opponent_player] do
    sequence(:email) { |n| "User#{n}@giz00gle.com" }
    password 'Real Men of Genius'
  end

  factory :game do
    host_player
    opponent_player
  end
end
