class Product < ActiveRecord::Base
  
  belongs_to :manufacturer
  #has_one :product_type

  validates :label, presence: true, uniqueness: true
  validates :manufacturer_id, presence: true

  def manufacturer
    Manufacturer::find( self.manufacturer_id ).label
  end

  def product_whitelist_labels
    return I18n::t( :empty_field ) if self.product_whitelist.empty?
    labels = [ ]
    self.product_whitelist.each do |p|
      labels.push( Product::find( p ).full_label )
    end
    return labels.join( ', ' )
  end

  def platform_whitelist_labels
    return I18n::t( :empty_field ) if self.platform_whitelist.empty?
    labels = [ ]
    self.platform_whitelist.each do |p|
      labels.push( Platform::find( p ).label )
    end
    return labels.join( ', ' )
  end
  
  def product_dependencies_labels
    return I18n::t( :empty_field ) if self.product_dependencies.empty?
    labels = [ ]
    self.product_dependencies.each do |p|
      labels.push( Product::find( p ).full_label )
    end
    return labels.join( ', ' )
  end

  def full_label
    return self.label + " #{self.version}"
  end

  def short_description
    return self.description if self.description.size <= 100
    self.description[0...100] + '(...)'
  end
  
end
