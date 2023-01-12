class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items << item
    item.label = self
  end

  def to_json(_options = {})
    {
      id:,
      title:,
      color:,
      items:
    }.to_json
  end
end
