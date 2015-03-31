module Storytime
  class MembershipPolicy
    attr_reader :user, :record

    def initialize(current_user, record)
      @current_user = current_user
      @membership = record
    end

    def manage?
      action = Storytime::Action.find_by(guid: "1f7d47")
      role = @current_user.storytime_role_in_site(Storytime::Site.current)
      role.present? && role.allowed_actions.include?(action)
    end

    def index?
      manage?
    end

    def create?
      manage?
    end

    def destroy?
      manage?
    end

    def permitted_attributes
      [:user_id, :storytime_role_id]
    end
  end
end
