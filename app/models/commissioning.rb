class Commissioning < ActiveRecord::Base
  
  has_and_belongs_to_many :users
  has_one  :client
  has_many :solutions
  has_many :activities#, dependent: :destroy
  
  validates :label, presence: true, uniqueness: true
  validates :client_id, presence: true

  def client_label
    Client::find( self.client_id ).label
  end

  def creator_name
    User::find( self.creator_id ).name
  end

  def commissioners_names
    names = [ ]
    self.commissioners.each { | u | names << u.name }
    names << 'None' if names.empty?
    return names.join( ?\n )
  end

  def creation_date
    I18n::localize( self.created_at )
  end

  def update_date
    I18n::localize( self.updated_at )
  end

  def short_description
    return self.description if self.description.size <= 100
    self.description[0...100] + '(...)'
  end
  
end
