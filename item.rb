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
end