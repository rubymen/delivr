class Ability
  include CanCan::Ability

  def initialize(user)
    order_abilities = Permission.where(model: 'Order').first
    type_abilities = Permission.where(model: 'Type').first
    category_abilities = Permission.where(model: 'Category').first
    user_abilities = Permission.where(model: 'User').first

    if user && user.is_a?(Admin)
      can :manage, :all
    end

    if user && user.is_a?(DeliveryManager)
      can :create, Order if order_abilities.manager_create
      can :read, Order if order_abilities.manager_read
      can :update, Order if order_abilities.manager_update
      can :delete, Order if order_abilities.manager_delete

      can :create, Type if type_abilities.manager_create
      can :read, Type if type_abilities.manager_read
      can :update, Type if type_abilities.manager_update
      can :delete, Type if type_abilities.manager_delete

      can :create, Category if category_abilities.manager_create
      can :read, Category if category_abilities.manager_read
      can :update, Category if category_abilities.manager_update
      can :delete, Category if category_abilities.manager_delete

      can :create, User if user_abilities.manager_create
      can :read, User if user_abilities.manager_read
      can :update, User if user_abilities.manager_update
      can :delete, User if user_abilities.manager_delete
    end

    if user && user.is_a?(Member)
      can :create, Order if order_abilities.member_create
      can :read, Order if order_abilities.member_read
      can :update, Order if order_abilities.member_update
      can :delete, Order if order_abilities.member_delete

      can :create, Type if type_abilities.member_create
      can :read, Type if type_abilities.member_read
      can :update, Type if type_abilities.member_update
      can :delete, Type if type_abilities.member_delete

      can :create, Category if category_abilities.member_create
      can :read, Category if category_abilities.member_read
      can :update, Category if category_abilities.member_update
      can :delete, Category if category_abilities.member_delete

      can :create, User if user_abilities.member_create
      can :read, User if user_abilities.member_read
      can :update, User if user_abilities.member_update
      can :delete, User if user_abilities.member_delete
    end
  end
end
