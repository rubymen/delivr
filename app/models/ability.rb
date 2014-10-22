class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.is_a?(Admin)
      can :manage, :all
    end

    if user && user.is_a?(DeliveryManager)
    end

    if user && user.is_a?(Member)
    end
  end
end
