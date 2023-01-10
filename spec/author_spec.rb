require_relative '../association/author'

describe '#Author' do
  it 'should have a name' do
    author = Author.new('John', 'Doe', [])
    expect("#{author.first_name} #{author.last_name}").to eq('John Doe')
  end

  it 'should have an empty list' do
    author = Author.new('John', 'Doe', [])
    expect(author.items).to eq([])
  end

  it 'should have a list of items' do
    author = Author.new('John', 'Doe', [])
    author.add_item('Item 1')
    author.add_item('Item 2')
    expect(author.items).to eq(['Item 1', 'Item 2'])
  end
end
