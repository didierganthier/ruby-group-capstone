require 'spec_helper'

describe Label do
  let(:label) { Label.new('Science Fiction', 'red') }

  describe '#initialize' do
    it 'creates a new Label instance' do
      expect(label).to be_a(Label)
    end

    it 'has a unique ID' do
      expect(label.id).to be_a(Integer)
    end

    it 'has a title' do
      expect(label.title).to eq('Science Fiction')
    end

    it 'has a color' do
      expect(label.color).to eq('red')
    end

    it 'has an empty array of items' do
      expect(label.items).to eq([])
    end
  end

  describe '#add_item' do
    let(:item) { double(:item) }

    it "sets the item's label to self" do
      allow(item).to receive(:label=)
      label.add_item(item)
      expect(item).to have_received(:label=).with(label)
    end
  end
end
