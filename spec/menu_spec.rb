require 'menu'

RSpec.describe Menu do
  it "constructs" do  
    menu = Menu.new
    
    expect(menu.list).to eq []
  end

  it "adds dishes to a menu" do
    dish1 = double :dish
    dish2 = double :dish
    menu = Menu.new
    menu.add(dish1)
    menu.add(dish2)

    expect(menu.list).to eq [dish1, dish2]
  end


end