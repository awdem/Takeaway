class ReceiptFormatter
  def initialize(order_in_progress) # order_in_progress is an instance of the OrderMaker class
    @order_in_progress = order_in_progress
  end

  def format
    itemized_list = order_items.map do |dish|
      "- #{dish.name}, price: #{dish.price}"
    end.join("\n") + "\ntotal price: #{self.sum}"
  end

  private

  def sum
    order_items.sum { |dish| dish.price.to_f }
  end

  def order_items
    @order_in_progress.check.list
  end
 
end