class Schedule
  attr_reader :table

  def initialize(days, positions, volunteers)
    @table = generate_table(days, positions)
    analyse_table(days, positions, volunteers)
  end

  def generate_table(days, positions)
    table = []
    days.count.times do
      table << Array.new(positions.count)
    end

    table
  end

  def analyse_table(days, positions, volunteers)
    @table.each_with_index do |day, y|
      day.each_with_index do |position, x|
        volunteers.select {|v| v.positions.include? positions[x]}
        binding.pry
      end
    end
  end
end
