require_relative '../classes/music_album'
describe MusicAlbum do
  context 'when testing music album' do
    name = 'Lexus Bay'
    publish_date = '2000-10-10'
    on_spotify = true
    music_album = MusicAlbum.new(name, publish_date, on_spotify)

    it 'return the instance of the class' do
      expect(music_album).to be_instance_of(MusicAlbum)
    end
    it 'return should return true when class MusicAlbum return true and on_spotify true' do
      expect(music_album.can_be_archived?).to be true
    end

    it 'should return the date instance of the class' do
      expect(music_album.publish_date).to eq(publish_date)
    end

    it 'should return the onspotlify instance of the class' do
      expect(music_album.on_spotify).to equal true
    end
  end
end
