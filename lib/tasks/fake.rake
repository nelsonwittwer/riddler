namespace :fake do
  desc "Add Fake Users"
  task :users => :environment do
    Fake.create_users
  end
  
  desc "Add Fake Hookups"
  task :hookups => :environment do
    Fake.create_hookups
  end
end
