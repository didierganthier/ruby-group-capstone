require 'date'

class Item
    attr_accessor :id, :archived, :label, :genre, :author, :source, :publish_date

    def initialize( archived: false,  publish_date)
        @id = Random.rand(1..100)
        @archived = archived
        @publish_date = publish_date
    end
    
   def label=(label)
       @label = label
       label.items.push(self) unless label.items.include?(self)
   end

   def gener=(gener)
       @gener = gener
       gener.items.push(self) unless gener.items.include?(self)
   end
   
   def author=(author)
       @author = author
       author.items.push(self) unless author.items.include?(self)
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
