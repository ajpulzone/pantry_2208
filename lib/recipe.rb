class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(item, quantity)
    ingredients_required[item] += quantity
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    total_calorie_array = []
    ingredients_required.collect do |ingredient, quantity|
      total_calorie_array << (ingredient.calories * quantity)
    end
    total_calorie_array.sum
  end
end
