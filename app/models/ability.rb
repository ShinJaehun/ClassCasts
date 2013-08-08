class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      # if user.role == "admin"
      #   can :manage, :all
      # else
      #   can :read, :all
      # end
    
        if user.role == "admin"
          can :manage, :all
        elsif user.role == "default"
          can :read, :all
          cannot [:create, :update, :destroy], Cast

          cannot :manage, Category

          can :manage, Post, :user_id => user.id
          cannot [:create, :update, :destroy], Post, :category_id => 1

        elsif user.role == "banned"
          cannot :manage, :all
        else
          can :read, :all # guest user
        end

    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
