class OrderMaker
  def initialize(menu, order, customer) # menu is an instance of the Menu Class, order is an instance of the Order class
    @menu = menu
    @order = order
    @customer = customer
  end

  def check_order(order) # order is an instance of the Order class
    @order
  end

  def select(dish) #dish is an instance of the dish class
    @menu.list.include?(dish) ? @order.list << dish : nil
  end

end