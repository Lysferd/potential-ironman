class Commissioning < ActiveRecord::Base
  
  has_and_belongs_to_many :users, dependent: :destroy
  has_one  :client, dependent: :destroy
  has_many :solutions, dependent: :destroy
  has_many :activities, dependent: :destroy
  
  validates :label, presence: true, uniqueness: true
  validates :client_id, presence: true

  def client
    Client::find( self.client_id ).label
  end

  def creator_name
    User::find( self.creator_id ).name
  end

  def users_names
    names = ''
    users.each do |u|
      names << u.name
    end
    return names
  end

  def creation_date
    I18n::localize( self.created_at )
  end

  def update_date
    I18n::localize( self.updated_at )
  end
  
end
