class Ability
  include CanCan::Ability

  def initialize( user )
    user.role.modes.each_key { | k | can *user.role.expand_mode( k ) }
  end
end
