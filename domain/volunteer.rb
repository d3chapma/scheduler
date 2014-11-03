class Volunteer
  attr_reader :positions

  def initialize(name, positions, scheduler)
    @name = name
    @positions = Collection.new
    positions.each_with_index do |indicator, index|
      @positions.add scheduler.positions[index] if indicator
    end
  end

  def key
    @name.downcase.to_sym
  end
end
