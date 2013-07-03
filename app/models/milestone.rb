class Milestone < ActiveRecord::Base
  attr_accessible :discount, :limit

  belongs_to :scramble
  has_many :orders

  validates :discount, :limit, presence: true
end
