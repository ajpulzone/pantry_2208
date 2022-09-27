class CookBook
  attr_reader :recipes

  def initialize
    @recipes = Array.new
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients_array = []
    recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
      ingredients_array << ingredient.name
      end
    end
    ingredients_array.uniq
  end

  def highest_calorie_meal
    recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def date
    date = Date.today.to_s
    "#{date[5..6]}-#{date[8..9]}-#{date[0..3]}"
  end

  def summary

  end 
end
