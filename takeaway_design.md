¡# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.


> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

- will need twilio gem for this

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

nouns:

customer, dishes, prices, meal, itemised receipt, available dishes, grand total, text, 

verbs:

check if I want to order
verify that my order is correct
see a list of dishes with prices
select some number of several available dishes
see an itemised receipt with a grand total
receive a text after I have ordered

```

```

_Also design the interface of each class in more detail._

```ruby
class Customer
  def initialize(number) # number is a string
    #...
  end

  def number
    # returns customer number
  end

end

class Menu
  def initialize
    # ...
  end

  def list
    # lists the dishes on the menu
  end

  def add(dish) #dish is an instance of the Dish class
    # returns nothing
    # fail state?
  end

end

class Dish
  def initialize(name, price) # name is a string, description is a string, price is a string
    # ...
  end

  def name
    # returns name
  end

  def price
    #returns price
  end
end

class OrderMaker
  def initialize(menu, customer, order) # menu is an instance of the Menu Class, customer is an instance of the Customer class, order is an instance of the Order class
    # ...
  end

  # def check_menu
  #   # displays the menu for the user to choose from 
  # end

  def check_order(order) # order is an instance of the Order class
    # returns a list of the dishes on the current order
  end

  def select(dish) #dish is an instance of the dish class
    # adds a dish to the current order
  end

end

class Order
  def initialize(customer) # customer is an instance of the customer class
    # ...
  end

  def list
    # lists the dishes in the order
  end

  def add(dish) #dish is an instance of the Dish class
    # returns nothing
    # fail state?
  end

class OrderCompleter(order_in_progress) # order_in_progress is an instance of OrderMaker class
  def initialize
    #...
  end
  
  def complete
    # sends text
  end
end

end

class MenuFormatter
    def initialize(menu) # menu is an instance of the Menu Class
    # ...
    end

    def format
      # returns formatted menu
    end
end

class ReceiptFormatter(order)
  def initialize

  end

  def format
    # returns formatted receipt
  end

end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# > As a customer  
# > So that I can check if I want to order something  
# > I would like to see a list of dishes with prices.

# 1  - creates a menu of dishes that returns a list of dishes

dish1 = Dish.new("name1", "price1")
dish2 = Dish.new("name2", "price2")
menu = Menu.new
menu.add(dish1)
menu.add(dish2)
menu.list # => [dish1, dish2]

# 2 - displays a formatted menu of dishes/prices before making order

dish1 = Dish.new("name1", "price1")
dish2 = Dish.new("name2", "price2")
menu = Menu.new
menu.add(dish1)
menu.add(dish2)
formatted_menu = MenuFormatter.new(menu).format  # => " 1) name1 - £price1\n2) name2 - £price2\n)


# > As a customer  
# > So that I can order the meal I want  
# > I would like to be able to select some number of several available dishes.

# 1 - creates an order, and adds dishes to it
customer = Customer.new("010000000001")
dish1 = Dish.new("name1", "price1")
dish2 = Dish.new("name2", "price2")
menu = Menu.new
new_order = Order.new
menu.add(dish1)
menu.add(dish2)
order_in_progress = OrderMaker.new(menu, new_order, customer)
order_in_progress.select(dish1)
new_order.list => [dish1]


# 1 - fails if selecting a dish not on the menu
customer = Customer.new("010000000001")
dish1 = Dish.new("name1", "price1")
dish2 = Dish.new("name2", "price2")
menu = Menu.new
new_order = Order.new
menu.add(dish1)
order_in_progress = OrderMaker.new(menu, new_order, customer)
order_in_progress.select(dish2) => # "fails with 'Not on the menu!'"

# > As a customer  
# > So that I can verify that my order is correct  
# > I would like to see an itemised receipt with a grand total.

# 1 - creates an order, and adds dishes to it
customer = Customer.new("010000000001")
dish1 = Dish.new("name1", "price1")
dish2 = Dish.new("name2", "price2")
menu = Menu.new
new_order = Order.new
menu.add(dish1)
menu.add(dish2)
order_in_progress = OrderMaker.new(menu, new_order, customer)
order_in_progress.select(dish1)
order_in_progress.check_order => # returns receipt


# > As a customer  
# > So that I am reassured that my order will be delivered on time  
# > I would like to receive a text such as "Thank you! Your order was placed and
# > will be delivered before 18:52" after I have ordered.



```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
## Menu
# 1 - constructs
menu = Menu.new
menu.list # => []

##Dish
# 2 - constructs
dish = Dish.new("name", "description")
dish.name # => "name"
dish.description # => "description"


##customer



```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
