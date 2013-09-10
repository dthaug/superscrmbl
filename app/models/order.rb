class Order < ActiveRecord::Base
 include PublicActivity::Common


  attr_accessible :address, :email, :name, :pay_type
  validates :name, :address, :email, :pay_type, presence: true

  
  belongs_to :scramble
  belongs_to :milestone

end
