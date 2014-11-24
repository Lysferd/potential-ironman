class Activity < ActiveRecord::Base
  
  belongs_to :commissioning
  belongs_to :user
  
end
