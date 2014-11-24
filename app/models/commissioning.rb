
class Commissioning < ActiveRecord::Base
  
  has_and_belongs_to_many :users
  has_one  :client
  has_many :solutions
  has_many :activities
  
  validates :label, presence: true, uniqueness: true
  validates :client_id, presence: true
  
end
