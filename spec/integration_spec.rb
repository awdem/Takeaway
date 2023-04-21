require 'dish'
require 'menu'


RSpec.describe "takeaway integration" do
  describe "menu creation" do
    it "creates a menu with several dishes" do
      dish1 = Dish.new("name1", "price1")
      dish2 = Dish.new("name2", "price2")
      menu = Menu.new
      menu.add(dish1)
      menu.add(dish2)
      expect(menu.list).to eq [dish1, dish2]          
    end
  end


end