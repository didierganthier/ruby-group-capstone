require 'date'

class Item
    attr_accessor :id, :archived, :label, :genre, :author, :source, :publish_date

    def initialize id, archived, label, genre, author, source, publish_date
        @id = id
        @archived = archived
        @label = label
        @genre = genre
        @author = author
        @source = source
        @publish_date = publish_date
    end

    def can_be_archived?
        # Return true if published_date is older than 10 years, otherwise false
        (Date.today - publish_date).to_i / 365 > 10
    end

    def move_to_archive
        # If the item can be archived, change the archived property to true
        @archived = true if can_be_archived?
    end
end