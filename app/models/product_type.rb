class ProductType < ActiveRecord::Base
  validates :label, presence: true, uniqueness: true
end
