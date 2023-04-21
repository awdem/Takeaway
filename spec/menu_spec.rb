require 'menu'

RSpec.describe Menu do
  it "constructs" do  
    menu = Menu.new
    expect(menu.list).to eq []
  end

  xit "adds dishes to a menu" do
    dish1 = Dish.new("name1", "price1")
    dish2 = Dish.new("name2", "price2")
    menu = Menu.new
    menu.add(dish1)
    menu.add(dish2)
    expect(menu.list).to eq [dish1, dish2]
  end
end