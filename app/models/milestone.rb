class Milestone < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :discount, :limit, :scramble_id

  belongs_to :scramble
  has_many :orders
  respond_to :json
=======
  attr_accessible :discount, :limit

  belongs_to :scramble
  has_many :orders

>>>>>>> fb3ba2d04f4648df475f1b76fbff538aa4792658
  validates :discount, :limit, presence: true
end
