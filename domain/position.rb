class Position
  attr_reader :name

  def initialize(name)
    @name       = name
    @occupants  = 1
  end

  def key
    @name.downcase.to_sym
  end
end
