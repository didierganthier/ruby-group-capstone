require 'json'
require_relative '../classes/genre'

module MusicAlbumModule
  def load_genres
    data = []
    file = './json_files/genres.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |genre|
        data.push(Genre.new(genre['name']))
      end
    else
      File.write('./json_files/genres.json', [])
    end

    data
  end

  def create_genre
    data = []
    @music_albums.each do |genre|
      data.push({ id: genre.id, name: genre.name })
    end
    File.write('./json_files/genres.json', JSON.generate(data))
  end
end
