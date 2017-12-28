class WikiPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    user.present?
  end

  def create?
    update?
  end

  def destroy?
    user.present?
  end

  def index?
    true
  end
end
