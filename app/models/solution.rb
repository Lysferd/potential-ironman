class Solution < ActiveRecord::Base
  
  belongs_to :commissioning
  has_one    :product
  has_one    :platform

  def product
    return Product::find( product_id ).label
  end

  def platform
    return Platform::find( platform_id ).label
  end
  
end
