require 'spec_helper'

describe Book do
  describe '#initialize' do
    it 'should initialize with correct title and cover_state' do
      book = Book.new('The Great Gatsby', 'good', Date.new(1925, 4, 10), nil)
      expect(book.title).to eq('The Great Gatsby')
      expect(book.cover_state).to eq('good')
    end
  end

  describe '#can_be_archived?' do
    context 'when cover_state is bad' do
      it 'should return true' do
        book = Book.new('The Great Gatsby', 'bad', Date.new(1925, 4, 10), nil)
        expect(book.can_be_archived?).to be(true)
      end
    end

    context 'when cover_state is good' do
      it 'should return false' do
        book = Book.new('The Great Gatsby', 'good', Date.new(1925, 4, 10), nil)
        expect(book.can_be_archived?).to be(true)
      end
    end
  end
end
