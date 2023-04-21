require "menu_formatter.rb"


RSpec.describe MenuFormatter do
  it "displays a menu with dishes and prices" do
    dish1 = double :dish, name: "name1", price: "price1"
    dish2 = double :dish, name: "name2", price: "price2"
    menu = double :menu, list: [dish1, dish2]

    expect(formatted_menu = MenuFormatter.new(menu).format).to eq "1) name1 - £price1\n2) name2 - £price2"
  end

  it 'fails if there is nothing on the menu' do
    menu = double :menu, list: []
    
    expect { formatted_menu = MenuFormatter.new(menu).format}.to raise_error "Nothing on the menu!"
  end
end