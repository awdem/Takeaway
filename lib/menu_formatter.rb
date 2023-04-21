MenuFormatter = Struct.new(:menu) do

  def format
    fail "Nothing on the menu!" if menu.list.empty?
    menu.list.each_with_index.map do |dish, i|
      "#{i + 1}) #{dish.name} - £#{dish.price}"
    end.join("\n")
  end

end