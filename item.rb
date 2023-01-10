require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :label, :genre, :author, :source

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..100)
    @archived = archived
    @publish_date = publish_date
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def can_be_archived?
    (Date.today - publish_date).to_i / 365 > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def to_json(_options = {})
    {
      id: id,
      archived: archived,
      publish_date: publish_date,
      label: label,
      genre: genre,
      author: author,
      source: source
    }.to_json
  end
end
