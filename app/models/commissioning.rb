class Commissioning < ActiveRecord::Base
  
  has_and_belongs_to_many :users, dependent: :destroy
  has_one  :client, dependent: :destroy
  has_many :solutions, dependent: :destroy
  has_many :activities, dependent: :destroy
  
  validates :label, presence: true, uniqueness: true
  validates :client_id, presence: true

  def client
    return Client::find( self.client_id ).label
  end
  
end
