class Milestone < ActiveRecord::Base
 include PublicActivity::Common
 
  attr_accessible :discount, :limit, :scramble_id

  belongs_to :scramble
  has_many :orders

  validates :discount, :limit, presence: true
end
