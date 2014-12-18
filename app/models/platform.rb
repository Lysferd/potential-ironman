class Platform < ActiveRecord::Base
  
  belongs_to :manufacturer
  #has_one :product_type

  validates :label, presence: true, uniqueness: true
  validates :manufacturer_id, presence: true
  
  def manufacturer
    Manufacturer::find( self.manufacturer_id ).label
  end

end
