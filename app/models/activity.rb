class Activity < ActiveRecord::Base
  
  belongs_to :commissioning
  belongs_to :user
  
  def user
    User::find( user_id ).name
  end

  def date_start_L
    I18n::localize( self.date_start )
  end

  def date_end_L
    I18n::localize( self.date_end )
  end

  def short_description
    return self.description if self.description.size <= 100
    self.description[0...100] + '(...)'
  end

end
