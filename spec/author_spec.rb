require_relative '../association/author'

describe '#Author' do
  it 'should have a name' do
    author = Author.new('John Doe')
    expect(author.name).to eq('John Doe')
  end

  it 'should have a list of books' do
    author = Author.new('John Doe')
    expect(author.books).to eq([])
  end

  it 'should be able to add a book' do
    author = Author.new('John Doe')
    author.add_book('The Book')
    expect(author.books).to eq(['The Book'])
  end
end

