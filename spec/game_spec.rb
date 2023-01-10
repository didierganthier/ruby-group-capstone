require_relative '.././game'
require 'date'

describe '#Game' do
  it 'should initailise an object of game' do
    date = Date.new
    date = date.year - 5
    put date
    last_played = date.year + 2
    put last_played
    game = Game.new(date, false, true, )
  end
end
