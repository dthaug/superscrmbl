class Scramble < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :description, :price, :title, :image, :item_count

=======
  attr_accessible :description, :price, :title, :image
  
  is_impressionable
 
>>>>>>> fb3ba2d04f4648df475f1b76fbff538aa4792658
  belongs_to :user

  has_many :milestones, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  accepts_nested_attributes_for :orders, :allow_destroy => :true

<<<<<<< HEAD
  validates :description, :price, :title, presence: true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, presence: true, :numericality => {:greater_than => 0}
  #validates :availableItems, :format => { :with => /^\d+??/ }, presence: true, :numericality => {:greater_than => 0}

  # validates_attachment :image, presence: true,
  #                           content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
  #                           size: { less_than: 5.megabytes }
=======
  validates :user_id, :description, :price, :image, :title, presence: true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, presence: true, :numericality => {:greater_than => 0}
 
>>>>>>> fb3ba2d04f4648df475f1b76fbff538aa4792658
  has_attached_file :image, styles: { medium: "400x400>",
                                      small:  "200x200#"}

  def revenue
    price * orders.count
  end

end
