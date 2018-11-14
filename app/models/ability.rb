class Ability
  include CanCan::Ability
  
  def initialize(user)
    if 
      user ||= User.new # guest user (not logged in)
      can :manage, User, id: user.id
    else 
      user.present? && user.admin? # administrator user (logged in)
      can :manage, :all
    end
  end
end
