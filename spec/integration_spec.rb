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

  describe "order making process" do
    context "given a menu with some dishes listed" do
      it "creates an order and allows customer to add dishes to it" do
        customer = Customer.new("010000000001")
        dish1 = Dish.new("name1", "price1")
        dish2 = Dish.new("name2", "price2")
        menu = Menu.new
        new_order = Order.new(customer)
        menu.add(dish1)
        menu.add(dish2)
        order_in_progress = OrderMaker.new(menu, new_order, customer)
        order_in_progress.select(dish1)

        expect(new_order.list).to eq [dish1]      
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

    context "given an empty menu" do
      xit "fails to start the process" do
        customer = Customer.new("010000000001")
        menu = Menu.new
        new_order = Order.new(customer)
        expect{OrderMaker.new(menu, new_order, customer)}.to raise_error "Nothing on the menu!"   
      end
    end
  end

  
  
end