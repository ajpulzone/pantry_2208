require "rspec"
require "./lib/ingredient.rb"

RSpec.describe Ingredient do

  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  describe "#initialize" do
    it "exists" do
      expect(@ingredient1).to be_an_instance_of(Ingredient)
    end

    it "has readable attributes" do
      expect(@ingredient1.name).to eq("Cheese")
      expect(@ingredient1.unit).to eq("oz")
      expect(@ingredient1.calories).to eq(50)
    end
  end
end
