require 'order_maker'


RSpec.describe OrderMaker do
  context "given a menu with some dishes listed" do
    it "creates an order and allows customer to add dishes to it" do
      customer = double :customer
      dish1 = double :dish
      dish2 = double :dish
      menu = double :dish, list: [dish1, dish2]
      new_order = double :order, list: []
      order_in_progress = OrderMaker.new(menu, new_order, customer)
      order_in_progress.select(dish1)

      expect(new_order.list).to eq [dish1]  
    end
  end
end