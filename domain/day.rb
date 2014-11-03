class Day
  attr_reader :date, :positions

  def initialize(date, positions_length)
    @date = date

  end

  def key
    date.strftime('%Y_%m_%d').to_sym
  end

  def method_missing(name, *args)
    @date.send(name, *args)
  end
end
