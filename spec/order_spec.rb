require "order" 


RSpec.describe Order do
  it "constructs" do
    customer = double :customer, number: "01000000001"
    order = Order.new(customer)
    expect(order.customer?).to eq "01000000001"
    expect(order.list).to eq []
  end

  it "adds a dish to the order" do
    customer = double :customer
    dish = double :dish
    order = Order.new(customer)
    order.add(dish)
    expect(order.list).to eq [dish]    
  end  

  
end