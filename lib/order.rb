class Order
  def initialize(customer) 
    @customer = customer
    @list = []
  end

  def customer?
    @customer.number
  end

  def list
    @list
  end

  def add(dish)
    @list << dish
    # fail state?
  end
end
