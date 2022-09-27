require "rspec"
require "./lib/ingredient.rb"
require "./lib/pantry.rb"
require "./lib/recipe.rb"

RSpec.describe Recipe do

  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  describe "#initialize" do
    it "exists" do
      expect(@recipe1).to be_an_instance_of(Recipe)
    end

    it "has readable attributes" do
      expect(@recipe1.name).to eq("Mac and Cheese")
      expect(@recipe1.ingredients_required).to eq({})
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient and quantity to the ingredients hash" do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)
      expect(@recipe1.ingredients_required).to eq({@ingredient1 => 6, @ingredient2 => 8})
    end
  end

  describe "#ingredients" do
    it "returns a list of ingredients that are in the ingredients required hash" do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)
      expect(@recipe1.ingredients).to eq([@ingredient1, @ingredient2])
    end
  end

  describe "#total_calories" do
    it "returns the total calories in a recipe" do
      [@pantry = Pantry.new
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)]

      expect(@recipe1.total_calories).to eq(440)
      expect(@recipe2.total_calories).to eq(675)
    end
  end
end
