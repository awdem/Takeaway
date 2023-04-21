class Menu
  def initialize
    @list = []
  end

  def list
    @list
  end

  def add(dish) 
    @list << dish
  end
end