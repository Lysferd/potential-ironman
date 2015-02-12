class Commissioning < ActiveRecord::Base
  
  has_and_belongs_to_many :users
  has_one  :client
  has_many :solutions
  has_many :activities#, dependent: :destroy
  
  validates :label, presence: true, uniqueness: true
  validates :client_id, presence: true

  before_validation :remove_empty_elements, if: lambda { self.authorized }

  def client_label
    Client::find( self.client_id ).label
  end

  def creator_name
    User::find( self.creator_id ).name
  end

  def commissioners_names
    names = [ ]
    self.commissioners.each { | id | names << User::find( id ).name }
    names << 'None' if names.empty?
    return names.join( ', ' )
  end

  def authorization_status
    self.authorized ? 'Sim' : 'Não'
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

  def depends
    self.solutions.each do |s|
      if not s.depends
        return true
      end
    end
    return false
  end

  def product_list
    list = [ ]
    self.solutions.each do |s|
      list.push( Solution::find( s ).product_id )
    end
    return list
  end

#  def validate_dependencies
#   product_list = [ ]
#  self.solutions.each do |s|
#   s.change_depends(true)
#  product_list.push( s.product_id )
#    end
#    
#    self.solutions.each do |s|
#      unless product_list.include?( Product::find(s.product_id).product_dependencies )
#        Solution::find( s ).depends = false
#      else
#        Solution::find( s ).depends = true
#      end
#      
#      #need to find a way to change value of `depends´ in solution.
#    end
#  end

    
  private
  def remove_empty_elements
    self.commissioners.reject!( &:empty? )
  end
end
