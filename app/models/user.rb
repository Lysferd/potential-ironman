require( 'digest/sha2' )

class User < ActiveRecord::Base

  attr_accessor :password_confirmation
  attr_reader   :password

  before_create { generate_token( :auth_token ) }

  has_and_belongs_to_many :commissionings
  has_one :role
  has_many :activities
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, confirmation: true
  validate :password_must_be_present
  
  def role
    return Role::find( self.role_id )
  end


  class << self
    def authenticate( email, password )
      if user = find_by_email( email )
        user if user.hashed_password == encrypt_password( password, user.salt )
      end
    end
    
    def encrypt_password( password, salt )
      Digest::SHA2.hexdigest( password + 'shampoo de rabanete' + salt )
    end

    def commissioners
      return self::where( role_id: Role::where( label: 'Comissionador' ) )
    end

    def draftsmen
      return self::where( role_id: Role::where( label: 'Projetista' ) )
    end
  end
  
  def password=( password )
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password( password, salt )
    end
  end
  
  private
  def password_must_be_present
    errors.add( :password, 'Missing password' ) unless hashed_password.present?
  end
  
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def generate_token( column )
    begin
      self[column] = SecureRandom::urlsafe_base64
    end while User::exists?( column => self[column] )
  end
end
