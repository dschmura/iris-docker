class BuildingPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @building = model
  end

  def index?
    return false if @current_user.nil?
    @current_user.admin?
  end

  def show?
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
      # return false if @current_user.nil?
      if current_user.nil?
        model.where(locations.visible => :true)

        # model.where(building_code_heprod: "1000154")
      else
        if current_user.admin?
          model.all
        else
          model.all
          # model.where(building.location.visible :false)
        end
      end
    end
  end
  def scope
    Pundit.policy_scope!(current_user, record.class)
  end
end
