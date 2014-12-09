class Product < ActiveRecord::Base
  
  belongs_to :manufacturer
  has_one :product_type
  
end
