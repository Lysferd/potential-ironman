class Solution < ActiveRecord::Base
  
  belongs_to :commissioning
  has_one    :product
  has_one    :platform

  validates :label,  presence: true
  validates :product_id, presence: true
  validates :platform_id, presence: true
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
    return unless self.label and self.product_id and self.platform_id
    unless Product::find( self.product_id ).platform_whitelist.include?( self.platform_id )
      errors.add( :platform_id )
    end

    Commissioning::find( self.commissioning_id ).solutions.each do |s|
      unless Product::find( s.product_id ).product_whitelist.include?( self.product_id )
        errors.add( :product_id )
        break
      end
    end
  end
  
end
