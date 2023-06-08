class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    can :read, :all
      # Define other abilities for non-admin users

  end
end
