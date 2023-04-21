require 'dish'

RSpec.describe Dish do
  it "constructs" do
    dish = Dish.new("name", "price")
    
    expect(dish.name).to eq "name"
    expect(dish.price).to eq "price"
  end
  
end