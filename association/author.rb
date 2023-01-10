class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(_id, first_name, last_name, items)
    @id = Random.rand(1..100)
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item(item)
    @items.push(item)
  end
end
