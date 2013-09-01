class Milestone < ActiveRecord::Base
  attr_accessible :discount, :limit, :scramble_id

  belongs_to :scramble
  has_many :orders
  respond_to :json
  validates :discount, :limit, presence: true
end
