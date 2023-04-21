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

  it "fails if trying to select a dish that is not on the menu" do
    customer = Customer.new("010000000001")
    dish1 = Dish.new("name1", "price1")
    dish2 = Dish.new("name2", "price2")
    menu = Menu.new
    new_order = Order.new(customer)
    menu.add(dish1)
    order_in_progress = OrderMaker.new(menu, new_order, customer)
    expect{order_in_progress.select(dish2)}.to raise_error "Not on the menu!"      
  end

end