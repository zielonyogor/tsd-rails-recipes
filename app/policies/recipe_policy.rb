class RecipePolicy < ApplicationPolicy
  def update?
    record.creator_id == user.id
  end
  def edit?
    update?
  end
  def destroy?
    update?
  end
end