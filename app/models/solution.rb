class Solution < ActiveRecord::Base
  
  belongs_to :commissioning
  has_one    :product
  has_one    :platform

  validates :label,  presence: true
  validates :product_id, presence: true
  validates :platform_id, presence: true
  before_validation :validate_compatibility

  def product
    Product::find( product_id ).full_label
  end

  def platform
    Platform::find( platform_id ).full_label
  end

  def short_description
    return self.description if self.description.size <= 100
    self.description[0...100] + '(...)'
  end

  def depends_status
    self.depends ? 'Sim' : 'Não'
  end

  def check_dependence
    Product::find( self.product_id ).product_dependencies.each do |s|
      if not Commissioning::find( self.commissioning_id ).product_list.include?( s )
        return false
      end
    end
    return true
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
