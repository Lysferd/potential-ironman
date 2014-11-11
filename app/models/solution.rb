class Solution < ActiveRecord::Base
  belongs_to :manufacturer
  belongs_to :platform
end
