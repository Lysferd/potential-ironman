class Ability
  include CanCan::Ability

  def initialize( user )
    #user.role.rules.each_key { | k | can *user.role.expand_mode( k ) }

    case user.role.label
    when 'Administrador'
      can :manage, :all
    when 'Analista'
      can :manage, [ Product, Platform, ProductType, Manufacturer ]
    when 'Comissionador'
      can :manage, Activity
    when 'Gerente'
      can :read, :all
    when 'Projetista'
      can :manage, Client
      can :manage, Commissioning, creator_id: user.id, authorized: false
      # doesnt work:
      #can :manage, Solution, :'commissioning.creator_id' => user.id
    end

  end
end
