require( 'digest/sha2' )

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         :timeoutable

  has_and_belongs_to_many :commissionings
  has_and_belongs_to_many :roles
  has_many :activities
  
  def role?( role )
    return !!self.roles.find_by_label( role.to_s.camelize )
  end
  
end
