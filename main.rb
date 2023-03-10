require 'json'
require './item'
require './association/book'
require './association/label'
require './association/author'
require './game'
require_relative './classes/music_album'
require_relative './classes/genre'
require_relative './modules/music_album_module'
require_relative './modules/genres_module'

@music_albums = load_music_albums
@load_genres = load_genres

game_json_from_file = File.read('games.json')
hash_games = JSON.parse(game_json_from_file)
games = if hash_games.empty?
          []
        else
          hash_games.map do |game|
            Game.new(game['publish_date'], game['archived'], game['multiplayer'], game['last_played_at'])
          end
        end
items = []
labels = []

author_json_from_file = File.read('authors.json')
hash_authors = JSON.parse(author_json_from_file)
authors = if hash_authors.empty?
            []
          else
            hash_authors.map do |author|
              Author.new(author['first_name'], author['last_name'], author['items'])
            end
          end

def add_game(games)
  puts 'Enter the published date:'
  publish_date = Date.parse(gets.chomp)
  puts 'Does it have Multiplayer (y/n)'
  is_multiplayer = gets.chomp
  is_multiplayer = is_multiplayer == 'y'
  puts 'Enter the last time you played the game date:'
  last_played_at = Date.parse(gets.chomp)
  game = Game.new(publish_date, false, is_multiplayer, last_played_at)
  games << game
end

def list_games(games)
  games.each do |game|
    puts "ID: #{game.id}"
    puts "Publish date: #{game.publish_date}"
    puts "Multiplayer: #{game.multiplayer}"
    puts "Last played at: #{game.last_played_at}"
    puts "Archived: #{game.archived}"
    puts ''
  end
end

at_exit do
  # Serialize the items and labels arrays to JSON
  items_json = items.to_json
  labels_json = labels.to_json
  games_json = games.to_json
  authors_json = authors.map do |author|
    {
      first_name: author.first_name,
      last_name: author.last_name,
      items: author.items
    }
  end

  # Save the JSON strings to files
  File.write('items.json', items_json)
  File.write('labels.json', labels_json)
  File.write('games.json', games_json)
  File.write('authors.json', authors_json.to_json)
end

def list_items(items)
  items.each do |item|
    puts "ID: #{item.id}"
    puts "Title: #{item.title}"
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

def add_new_book(items)
  puts 'Enter the publish date (YYYY-MM-DD):'
  publish_date = Date.parse(gets.chomp)
  puts 'Enter the title:'
  title = gets.chomp
  puts 'Enter the cover state:'
  cover_state = gets.chomp
  book = Book.new(title, cover_state, publish_date, archived: false)
  items << book
end

def list_books(items)
  # List all books
  items.select { |item| item.is_a?(Book) }.each do |book|
    puts "ID: #{book.id}"
    puts "Title: #{book.title}"
    puts "Publish date: #{book.publish_date}"
    puts "Cover state: #{book.cover_state}"
    puts "Archived: #{book.archived}"
  end
end

def add_new_label(labels)
  puts 'Enter the title:'
  title = gets.chomp
  puts 'Enter the color:'
  color = gets.chomp
  label = Label.new(title, color)
  labels << label
end

def list_labels(labels)
  labels.each do |label|
    puts "ID: #{label.id}"
    puts "Title: #{label.title}"
    puts "Color: #{label.color}"
    puts "Items: #{label.items.map(&:id).join(', ')}"
    puts ''
  end
end

def add_author(authors)
  p 'First Name: '
  first_name = gets.chomp
  p 'Last Name: '
  last_name = gets.chomp
  author = Author.new(first_name, last_name, [])
  authors << author
end

def list_authors(authors)
  authors.each do |author|
    puts "ID: #{author.id}"
    puts "First Name: #{author.first_name}"
    puts "Last Name: #{author.last_name}"
  end
end

def list_all_music_album
  puts 'Music Albums'
  @music_albums.each do |music_album|
    puts "Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
  end
end

def list_all_genres
  puts 'Genres:'
  puts 'No genre found' if @load_genres.empty?
  @load_genres.each do |genre|
    puts "Genre name: #{genre.name}"
  end
end

def add_music_album
  puts 'Album name: '
  name = gets.chomp

  puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
  publish_date = gets.chomp

  puts 'Is it available on Spotify? Y/N'
  on_spotify = gets.chomp.downcase
  case on_spotify
  when 'y'
    @music_albums.push(MusicAlbum.new(name, publish_date, true))
  when 'n'
    @music_albums.push(MusicAlbum.new(name, publish_date, false))
  end
  puts 'Music album created'
end

def options
  puts 'Choose an option:'
  puts '1. List all books'
  puts '2. List all labels'
  puts '3. Add a new book'
  puts '4. Add a new label'
  puts '5. Add a new game'
  puts '6. List all the games'
  puts '7. Add an author'
  puts '8. List all the authors'
  puts '9. List all genre'
  puts '10.List Music Albums'
  puts '11.Add Music Albums'
  puts '12.Quit.'
end

loop do
  options
  choice = gets.chomp
  case choice
  when '1'
    list_books(items)
  when '2'
    # List all labels
    list_labels(labels)
  when '3'
    # Add a new book
    add_new_book(items)
  when '4'
    # Add a new label
    add_new_label(labels)
  when '5'
    add_game(games)
  when '6'
    list_games(games)
  when '7'
    add_author(authors)
  when '8'
    list_authors(authors)
  when '9'
    list_all_genres
  when '10'
    list_all_music_album
  when '11'
    add_music_album
  when '12'
    break
  else
    puts 'Invalid choice'
  end
end
