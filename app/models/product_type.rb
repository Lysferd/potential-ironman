class ProductType < ActiveRecord::Base
  validates :label, presence: true, uniqueness: true

  def short_description
    return self.description if self.description.size <= 100
    self.description[0...100] + '(...)'
  end

end
