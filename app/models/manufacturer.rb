class Manufacturer < ActiveRecord::Base
  
  has_many :products, dependent: :destroy
  has_many :platforms, dependent: :destroy
  
end
