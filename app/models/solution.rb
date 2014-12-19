class Solution < ActiveRecord::Base
  
  belongs_to :commissioning
  has_one    :product
  has_one    :platform

  before_validation :validate_compatibility

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

  private
  def validate_compatibility
    unless Product::find( self.product_id ).platform_whitelist.include?( self.platform_id )
      errors.add( :product_id, 'is not compatible with the platform' )
    end
  end
  
end
