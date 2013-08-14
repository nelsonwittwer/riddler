class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  ##
  # Associations
  #
  has_many :games
  has_many :questions

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(
                           :provider => auth.provider,
                           :uid => auth.uid,
                           :email => auth.info.email,
                           :password => Devise.friendly_token[0,20],
                           :profile_picture_url => "https://graph.facebook.com/#{auth.uid}/picture?width=150&height=150",
                           :first_name => auth.info.first_name,
                           :last_name => auth.info.last_name,
                           :gender => auth.extra.first.last["gender"],
                           :timezone => auth.extra.first.last["timezone"]
                         )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
