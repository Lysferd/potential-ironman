class Platform < ActiveRecord::Base
  
  belongs_to :manufacturer
  #has_one :product_type

  validates :label, presence: true, uniqueness: true
  validates :manufacturer_id, presence: true
  
  def manufacturer
    Manufacturer::find( self.manufacturer_id ).label
  end

  def short_description
    return self.description if self.description.size <= 100
    self.description[0...100] + '(...)'
  end

  def full_label
    return self.label + " #{self.version}"
  end

end
