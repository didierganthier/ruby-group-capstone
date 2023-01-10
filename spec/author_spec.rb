require_relative '../association/author'

describe '#Author' do
  it 'should have a name' do
    author = Author.new('John Doe')
    expect(author.name).to eq('John Doe')
  end
end
