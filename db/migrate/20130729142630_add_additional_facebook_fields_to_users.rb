class AddAdditionalFacebookFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_picture_url, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
  end
end
