require "order" 


RSpec.describe Order do
  it "constructs" do
    customer = double :customer, number: "01000000001"
    order = Order.new(customer)
    expect(order.customer?).to eq "01000000001"
    expect(order.list).to eq []
  end
end