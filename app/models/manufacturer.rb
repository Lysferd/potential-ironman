class Manufacturer < ActiveRecord::Base
  
  has_many :products, dependent: :destroy
  has_many :platforms, dependent: :destroy
  
  def manufacturer
    return Manufacturer::find( manufacturer_id ).label
  end

end
