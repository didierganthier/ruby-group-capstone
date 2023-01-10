require './item'

class Book < Item
  attr_accessor :title, :cover_state

  def initialize(title, cover_state, publish_date, archived: false)
    super(publish_date, archived)
    @title = title
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
