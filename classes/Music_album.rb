require_relative '../item'

class MusicAlbum < Item
  attr_accessor :name, :publish_date

  def initialize(name, publish_date)
    @id = Random.rand(1..100)
    super(publish_date) #Music alls all constructor item with super 
    @name = name
  end

  
  def can_be_archived?
    super 
  end

end