class Collection
  def initialize
    @objects = []
  end

  def add(object)
    throw 'Duplicate object key' if find(object.key)
    @objects.push object
  end

  def find(key)
    @objects.find {|o| o.key == key}
  end

  def method_missing(name, *args)
    @objects.send(name, *args)
  end

  def collect(&block)
    new_array = []
    @objects.each do |o|
      new_array << block.call(o)
    end

    new_array
  end

  def each(&block)
    @objects.each do |o|
      block.call(o)
    end
  end

  def select(&block)
    array = []
    @objects.each do |o|
      array << o if block.call(o)
    end
  end
end
