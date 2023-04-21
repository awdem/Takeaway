require "receipt_formatter"

RSpec.describe ReceiptFormatter do
  context "given a menu with some dishes listed and an order in progress" do
    it "allows customer to see an itemised receipt of the order in progress with sum of prices" do
      customer = Customer.new("010000000001")
      dish1 = Dish.new("name1", "1")
      dish2 = Dish.new("name2", "2")
      menu = Menu.new
      new_order = Order.new(customer)
      menu.add(dish1)
      menu.add(dish2)
      order_in_progress = OrderMaker.new(menu, new_order, customer)
      order_in_progress.select(dish1)
      order_in_progress.select(dish2)
      receipt = ReceiptFormatter.new(order_in_progress).format
      
      expect(receipt).to eq "- name1, price: 1\n- name2, price: 2\ntotal price: 3"
    end
  end

  # test for if prices are floats, also need to mock the above
end