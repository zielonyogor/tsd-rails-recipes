class Ingredient < ApplicationRecord
  belongs_to :recipe

  has_one_attached :photo

  validate :recipe_has_ingredient_capacity

  private

  def recipe_has_ingredient_capacity
    return unless recipe

    existing_ingredients_count = recipe.ingredients.where.not(id: id).count
    return if existing_ingredients_count < 3

    errors.add(:recipe, "can have at most 3 ingredients")
  end
end
