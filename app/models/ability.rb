# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.present?
      if user.admin?
        can :manage, :all
      else
        can [:read, :create], :all
        can []:update, :destroy], Post, user: user
        can :destroy, Comment, user: user
      end
    end
    
  end
end
