class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, #:recoverable
        :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :description, :provider, :uid


  has_attached_file :avatar,  :styles => {
									      :thumb => "30x30#",
									      :small  => "70x70>",
									      :medium => "400x300" }

  has_many :scrambles, :dependent => :destroy

  def self.find_for_facebook_oauth(omniauth)
  if user = User.find_by_email(omniauth.info.email)
    if omniauth.info.image.present?
      user.update_attribute(:avatar, omniauth.info.image)
    end
    user
  else # Create a user with a stub password. 
    User.create!(:email => omniauth.info.email,
                 :name => omniauth.info.name,
                 :avatar => omniauth.info.image,
                 :password => Devise.friendly_token[0,20])
                if user.save
              sign_in_and_redirect user, :event => :authentication
            else
              session["devise.facebook_data"] = env["omniauth.auth"]
              redirect_to new_user_registration_url
        end
  end
end

def self.new_with_session(params, session)
  super.tap do |user|
    if omniauth = session["devise.facebook_data"]
      user.email = omniauth.info.email
      user.name = omniauth.info.name
      user.avatar = omniauth.info.image
    end
  end
end

end