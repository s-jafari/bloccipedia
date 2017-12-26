class WikiPolicy < ApplicationPolicy
  def update?
    user.present?
  end

  def create?
    user.present?
  end

  def index?
    user.present?
  end
end
