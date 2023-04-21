require 'order_maker'


RSpec.describe OrderMaker do
  it "constructs" do
    customer = double :customer
    menu = double :menu
    new_order = double :order
    order_in_progress = OrderMaker.new(menu, new_order, customer)

    expect(order_in_progress.check).to eq new_order
  end
  
  context "given a menu with some dishes listed" do
    it "creates an order and allows customer to add dishes to it" do
      customer = double :customer
      dish1 = double :dish
      dish2 = double :dish
      menu = double :menu, list: [dish1, dish2]
      new_order = double :order, list: []
      order_in_progress = OrderMaker.new(menu, new_order, customer)
      order_in_progress.select(dish1)

      expect(new_order.list).to eq [dish1]  
    end
  end

  it "fails if trying to select a dish that is not on the menu" do
    customer = double :customer
    dish1 = double :dish
    dish2 = double :dish
    menu = double :menu, list: [dish1]
    new_order = double :order, list: []
    order_in_progress = OrderMaker.new(menu, new_order, customer)
    expect{order_in_progress.select(dish2)}.to raise_error "Not on the menu!"      
  end

end