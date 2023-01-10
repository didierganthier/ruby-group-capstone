require_relative './item'

class Game < Item

  attr_accessor :multiplayer, :last_played_at

  def initialize (id, genre, author, source, publish_date, archived, multiplayer, last_played_at)
    super(publish_date, archived)
    gener(genre)
    author(author)
    source(source)
    @multiplayer = multiplayer
    @last_played_at = last_played_at

  end

end
