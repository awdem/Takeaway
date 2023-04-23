class OrderMaker
  def initialize(menu, order, customer) # menu is an instance of the Menu Class, order is an instance of the Order class
    fail "Nothing on the menu!" if menu.list.empty?
    @menu = menu
    @order = order
    @customer = customer
  end

  def check
    @order
  end

  def select(dish) #dish is an instance of the dish class
    @menu.list.include?(dish) ? @order.list << dish : fail("Not on the menu!")
  end
 
end