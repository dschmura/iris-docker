class LocationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @location = model
  end

  def index?

  end

  def show?
    return false if @current_user.nil?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end

  class Scope < Struct.new(:current_user, :model)
    def resolve

      if current_user.nil?


        model.all

        #scope.where(visible: false)

      else
        if current_user.admin?
          scope.all? { ||}
        else
          model.all
          #model.where(building.location.visible :false)
        end

      end
    end
  end

  def scope
    Pundit.policy_scope!(current_user, record.class)
  end

end