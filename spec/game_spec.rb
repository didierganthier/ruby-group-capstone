require 'spec_helper'
require 'date'

describe '#Game' do
  it 'should initailise an object of game' do
    date = Date.today
    published = date - (365 * 5)
    last_played = date - (365 * 3)
    game = Game.new(published, false, true, last_played)

    expect(game).to be_an_instance_of(Game)
  end

  it 'should return true if the game can be archived' do
    date = Date.today

    published = date - (365 * 5)
    last_played = date - (365 * 4)

    game = Game.new(published, false, true, last_played)
    expect(game.can_be_archived?).to be true
  end
end
