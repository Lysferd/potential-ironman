class Solution < ActiveRecord::Base
  
  belongs_to :commissioning
  has_one    :product
  has_one    :platform

  def product
    Product::find( product_id ).label
  end

  def platform
    Platform::find( platform_id ).label
  end

  def short_description
    return self.description if self.description.size <= 100
    self.description[0...100] + '(...)'
  end
  
end
