require_relative '../classes/genre'
require_relative '../item'
describe Genre do
  context 'when testing genre class do' do
    name = 'rock'
    genre = Genre.new(name)
    item = Item.new('2014-11-10')
    it 'should return an instance of the class' do
      expect(genre).to be_instance_of(Genre)
    end

    it 'should return name instance of the genre class ' do
      expect(genre.name).to equal(name)
    end

    it 'should return the item passed into genre items array' do
      genre.add_genre(item)
      expect(genre.items[0]).to eq(item)
    end
  end
end
