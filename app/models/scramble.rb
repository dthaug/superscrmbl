class Scramble < ActiveRecord::Base
  attr_accessible :description, :price, :title, :image, :item_count

  belongs_to :user

  has_many :milestones, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  accepts_nested_attributes_for :orders, :allow_destroy => :true

  validates :description, :price, :title, presence: true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, presence: true, :numericality => {:greater_than => 0}
  #validates :availableItems, :format => { :with => /^\d+??/ }, presence: true, :numericality => {:greater_than => 0}

  # validates_attachment :image, presence: true,
  #                           content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
  #                           size: { less_than: 5.megabytes }
  has_attached_file :image, styles: { medium: "400x400>",
                                      small:  "200x200#"}

end
