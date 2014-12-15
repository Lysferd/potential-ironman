class Client < ActiveRecord::Base
  
  has_many :commissionings, dependent: :destroy
  
end
