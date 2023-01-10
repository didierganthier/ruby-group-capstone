require_relative '../item'

class MusicAlbum < Item
  attr_accessor :name, :publish_date

  def initialize(name, publish_date)
    @id = Random.rand(1..100)
    super(publish_date)
    @name = name
  end
end
