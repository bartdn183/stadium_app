class Ability
	include CanCan::Ability

	def initialize(user)

		if user.admin?
			can :manage, Product
			can :manage, Vendor
			can :manage, Stadium
		elsif 
			can :show, Product
			can :show, Vendor
			can :show, Stadium
		end
	end
end
