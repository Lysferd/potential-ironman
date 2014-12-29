class Role < ActiveRecord::Base
  
  belongs_to :users
  before_save :hashify_modes

  #-------------------------------------------------------------------------
  # * Permission Mode Hash Expansion
  # In PostgreSQL, data of type hash is stored as strings, so they have to
  # be expanded to be used with CanCan.
  #-------------------------------------------------------------------------
  def expand_mode( key )
    fail ArgumentError unless self.modes.include?( key )
    obj = !!(key =~ /all/i) ? key.intern : key.to_s
    permission = self.modes[key].intern
    return permission, obj
  end

  private
  def hashify_modes
    byebug
  end
end
