class Role < ActiveRecord::Base
  
  belongs_to :users
  before_create :hashify_rules
  validates :label, presence: true, uniqueness: true

  #-------------------------------------------------------------------------
  # * Permission Mode Hash Expansion
  # In PostgreSQL, data of type hash is stored as strings, so they have to
  # be expanded to be used with CanCan.
  #-------------------------------------------------------------------------
  def expand_mode( key )
    fail ArgumentError unless self.rules.include?( key )
    obj = !!(key =~ /all/i) ? key.intern : key.to_s
    permission = self.rules[key].intern
    return permission, obj
  end

  private
  def hashify_rules
    self.errors.add( :rules, 'Missing rules' ) if self.rules.empty?
    #byebug
  end
end
