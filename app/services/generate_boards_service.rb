class GenerateBoardsService < BaseService
  def self.generate(number)
    ids = []
    number.times do
      ids << Board.create!(board_properties: {strips: Bingo::Board.generate}).id
    end
    ids
  end
end
