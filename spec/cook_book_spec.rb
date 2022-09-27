require "rspec"
require "./lib/ingredient.rb"
require "./lib/pantry.rb"
require "./lib/recipe.rb"
require "./lib/cook_book.rb"
require "date"

RSpec.describe CookBook do

  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@cookbook).to be_an_instance_of(CookBook)
    end

    it "has readable attributes" do
      expect(@cookbook.recipes).to eq([])
    end
  end

  describe "#add_recipe" do
    it "adds recipes to the recipe array"do
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
      expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
    end
  end

#I feel like I could end up using inheritence for this, or a module
  describe "#ingredients" do
    it "returns and array containing all ingredients needed " do
      @pantry = Pantry.new
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)

      expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end
  end

  describe "#highest_calorie_meal" do
    it "returns the recipe that contains the most calories" do
      @pantry = Pantry.new
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)

      expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
    end
  end

  describe "#date" do
    it "returns the date the cookbook was created" do
      expect(@cookbook.date).to eq("09-27-2022")
    end
  end

  describe "#summary" do
    it "returns an array that contains a hash containing the recipes and all recipe info" do
      expect(@cookbook.summary).to eq([{:name => "Mac and Cheese",
                                        :details => {:ingredients => [{:ingredient=> "Macaroni", :amount=>"8 oz"},
                                                                      {:ingredient=>"Cheese", :amount=>"2 C"}],
                                                    :total_calories => 440}},
                                        {:name=>"Burger",
                                        :details => {:ingredients => [{:ingredient => "Ground Beef", :amount => "4 oz"},
                                                                      {:ingredient => "Bun", :amount => "100 g"}],
                                                     :total_calories=>500}}])
    end
  end
end
