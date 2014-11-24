class Solution < ActiveRecord::Base
  
  belongs_to :commissioning
  has_one    :product
  has_one    :platform
  
end
