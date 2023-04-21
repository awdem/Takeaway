class ReceiptFormatter
  def initialize(order_in_progress) # order_in_progress is an instance of the OrderMaker class
    @order_in_progress = order_in_progress
  end

  def format
    itemized_list = @order_in_progress.check.list.map do |dish|
      "- #{dish.name}, price: #{dish.price}"
    end.join("\n")
    itemized_list + "\ntotal price: #{self.sum}"
  end

  private

  def sum
    @order_in_progress.check.list.sum { |dish| dish.price.to_i }
  end
 
end