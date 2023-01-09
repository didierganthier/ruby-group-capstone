# An array of items
items = []

while true
  puts "Choose an option:"
  puts "1. List all items"
  puts "2. Move an item to the archive"
  puts "3. Quit"

  choice = gets.chomp
  case choice
  when "1"
    # List all items
    items.each do |item|
      puts "ID: #{item.id}"
      puts "Genre: #{item.genre}"
      puts "Author: #{item.author}"
      puts "Source: #{item.source}"
      puts "Label: #{item.label}"
      puts "Publish date: #{item.publish_date}"
      puts "Archived: #{item.archived}"
      puts ""
    end
  when "2"
    # Move an item to the archive
    puts "Enter the ID of the item to move to the archive:"
    item_id = gets.chomp.to_i
    # Find the item with the given ID
    item = items.find { |i| i.id == item_id }
    if item
      item.move_to_archive
      puts "Item moved to the archive"
    else
      puts "Item not found"
    end
  when "3"
    break
  else
    puts "Invalid choice"
  end
end
