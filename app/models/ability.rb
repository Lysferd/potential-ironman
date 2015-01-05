class Ability
  include CanCan::Ability

  def initialize( user )
    user.role.rules.each_key { | k | can *user.role.expand_mode( k ) }
  end
end
