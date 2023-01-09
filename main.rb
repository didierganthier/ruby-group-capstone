require './item'

def list_items(items)
  items.each do |item|
    puts "ID: #{item.id}"
    puts "Genre: #{item.genre}"
    puts "Author: #{item.author}"
    puts "Source: #{item.source}"
    puts "Label: #{item.label}"
    puts "Publish date: #{item.publish_date}"
    puts "Archived: #{item.archived}"
    puts ''
  end
end

def move_item_to_archive(items)
  puts 'Enter the ID of the item to move to the archive:'
  item_id = gets.chomp.to_i
  # Find the item with the given ID
  item = items.find { |i| i.id == item_id }
  if item
    item.move_to_archive
    puts 'Item moved to the archive'
  else
    puts 'Item not found'
  end
end

def add_new_item(items)
  puts 'Enter the publish date (YYYY-MM-DD):'
  publish_date = Date.parse(gets.chomp)
  item = Item.new(publish_date)
  puts 'Enter the genre:'
  item.genre = gets.chomp
  puts 'Enter the author:'
  item.author = gets.chomp
  puts 'Enter the source:'
  item.source = gets.chomp
  puts 'Enter the label:'
  item.label = gets.chomp
  items << item
end

# An array of items
items = []

loop do
  puts 'Choose an option:'
  puts '1. List all items'
  puts '2. Move an item to the archive'
  puts '3. Add a new item'
  puts '4. Quit'

  choice = gets.chomp
  case choice
  when '1'
    list_items(items)
  when '2'
    move_item_to_archive(items)
  when '3'
    add_new_item(items)
  when '4'
    break
  else
    puts 'Invalid choice'
  end
end
