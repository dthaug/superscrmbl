class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, #:recoverable
        :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :description, :provider, :uid


  has_attached_file :avatar,  :styles => {
									      :thumb => "30x30#",
									      :small  => "70x70>",
									      :medium => "400x300" }

  has_many :scrambles, :dependent => :destroy

def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
 user = User.where(:provider => auth.provider, :uid => auth.uid).first
 unless user
 user = User.create(name:auth.extra.raw_info.name,
                     provider:auth.provider,
                     uid:auth.uid,
                     email:auth.info.email,
                     password:Devise.friendly_token[0,20]
                     )
 end
 user
 end
 
end