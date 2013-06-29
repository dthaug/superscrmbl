class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, #:recoverable
        :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :description


  has_attached_file :avatar,  :styles => {
									      :thumb => "30x30#",
									      :small  => "70x70>",
									      :medium => "400x300" }

  has_many :scrambles, :dependent => :destroy
  
end
