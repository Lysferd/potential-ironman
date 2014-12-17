class Platform < ActiveRecord::Base
  
  belongs_to :manufacturer
  
  def manufacturer
    return Manufacturer::find( self.manufacturer_id ).label
  end

end
