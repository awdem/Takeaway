require "receipt_formatter"

RSpec.describe ReceiptFormatter do
  context "given a menu with some dishes listed and an order in progress" do
    it "allows customer to see an itemised receipt of the order in progress with sum of prices" do
      dish1 = double :dish, name: "name1", price: "1"
      dish2 = double :dish, name: "name2", price: "2"
      new_order = double :order, list: [dish1, dish2]
      order_in_progress = double :order_maker, check: new_order
      receipt = ReceiptFormatter.new(order_in_progress).format
      
      expect(receipt).to eq "- name1, price: 1\n- name2, price: 2\ntotal price: 3.0"
    end

    it "sums prices that are floats on receipt" do
      dish1 = double :dish, name: "name1", price: "1.99"
      dish2 = double :dish, name: "name2", price: "2.99"
      new_order = double :order, list: [dish1, dish2]
      order_in_progress = double :order_maker, check: new_order
      receipt = ReceiptFormatter.new(order_in_progress).format
      
      expect(receipt).to eq "- name1, price: 1.99\n- name2, price: 2.99\ntotal price: 4.98"
    end
  end
end