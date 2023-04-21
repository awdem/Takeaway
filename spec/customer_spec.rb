require 'customer'

RSpec.describe Customer do
  it "constructs" do
    customer = Customer.new("010000000001")
    expect(customer.number).to eq "010000000001"
  end
end