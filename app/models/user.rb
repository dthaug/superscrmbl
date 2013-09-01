class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, #:recoverable
        :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :description, :provider, :uid


  has_attached_file :avatar,  :styles => {
									      :thumb => "30x30#",
									      :small  => "70x70>",
									      :medium => "400x300" }

  has_many :scrambles, :dependent => :destroy
  has_many :orders

def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                            avatar:URI.parse(auth.info.image)
                          )
      end
       
    end
  end
end