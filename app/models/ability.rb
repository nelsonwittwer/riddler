class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.is_admin
         can :manage, :all
       else
         can :create, User
         can :manage, User do |u|
           u.id == user.id
         end
         can :read, :all
       end
  end
end
