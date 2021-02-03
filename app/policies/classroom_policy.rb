class ClassroomPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @classrooms = policy_scope(Classroom)

  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    current_user.admin?
  end

  def new?
    create?
  end

  def update?
    current_user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope < Struct.new(:current_user, :model)
    def resolve
      return false if @current_user.nil?
      if current_user.admin?
        model.all
      else
        model.where(light_control: :false)
      end
    end
  end
  def scope
    Pundit.policy_scope!(current_user, record.class)
  end
end

