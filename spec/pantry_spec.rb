require "rspec"
require "./lib/ingredient.rb"
require "./lib/pantry.rb"
require "./lib/recipe.rb"

RSpec.describe Pantry do

  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  describe "#initialize" do
    it "exists" do
      expect(@pantry).to be_an_instance_of(Pantry)
    end

    it "has readable attributes" do
      expect(@pantry.stock).to eq({})
    end
  end

  describe "#stock_check" do
    it "checks how many of the ingredient passed as
        an argument the pantry has in stock" do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
    end
  end

  describe "#restock" do
    it "adds an ingredient and/or increases item quantity to the pantry" do
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
      expect(@pantry.stock_check(@ingredient1)).to eq(15)
      @pantry.restock(@ingredient2, 7)
      expect(@pantry.stock_check(@ingredient2)).to eq(7)
    end
  end

  describe "#enough_ingredients_for?" do
    it "returns a boolean value, true if there are enough ingredients to make a recipe" do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)

      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
      @pantry.restock(@ingredient2, 7)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
      @pantry.restock(@ingredient2, 1)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
    end
  end
end
