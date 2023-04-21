require 'dish'
require 'menu'
require 'menu_formatter'

RSpec.describe "takeaway integration" do
  describe "menu creation and display" do
    it "creates a menu with several dishes" do
      dish1 = Dish.new("name1", "price1")
      dish2 = Dish.new("name2", "price2")
      menu = Menu.new
      menu.add(dish1)
      menu.add(dish2)
      expect(menu.list).to eq [dish1, dish2]          
    end

    it "displays a menu with dishes and prices" do
      dish1 = Dish.new("name1", "price1")
      dish2 = Dish.new("name2", "price2")
      menu = Menu.new
      menu.add(dish1)
      menu.add(dish2)
      expect(formatted_menu = MenuFormatter.new(menu).format).to eq "1) name1 - £price1\n2) name2 - £price2"
    end
  end

  
end