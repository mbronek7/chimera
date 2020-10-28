class BingoBoard
  def self.generate
    columns = get_columns
    add_blanks(columns).to_json
  end

  private_class_method def self.get_columns
    columns = Array.new(9, nil)
    columns[0] = 1.upto(9).to_a
    1.upto(7).each do |j|
      columns[j] = (10 * j).upto((10 * (j + 1))-1).to_a
    end
    columns[8] = 80.upto(90).to_a
    columns
  end

  private_class_method def self.add_blanks(columns)
    (0..8).each do |i|
      columns[i] = columns[i].sample(3)
      n = rand(3).eql?(1) ? 2 : 1
      n.times do
        columns[i][rand(3)] = nil
      end
    end
    columns
  end
end
