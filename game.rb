require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, archived, multiplayer, last_played_at)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    @archived = super || (Date.today - Date.parse(@last_played)).to_i / 365 > 2
    # Return true if published_date is older than 5 years, otherwise false
    @archived
  end
end
