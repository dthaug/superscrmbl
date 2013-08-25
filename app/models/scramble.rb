class Scramble < ActiveRecord::Base
  attr_accessible :description, :price, :title, :image
  
  is_impressionable
 
  belongs_to :user



  has_many :milestones, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  accepts_nested_attributes_for :orders, :allow_destroy => :true

  validates :user_id, :description, :price, :image, :title, presence: true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, presence: true, :numericality => {:greater_than => 0}
 
  has_attached_file :image, styles: { medium: "400x400>",
                                      small:  "200x200#"}

end
