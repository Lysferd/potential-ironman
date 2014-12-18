class Manufacturer < ActiveRecord::Base
  
  has_many :products
  has_many :platforms

  validates :label, presence: true, uniqueness: true
  
end
