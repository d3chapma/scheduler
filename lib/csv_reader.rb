class CsvReader
  def initialize(filename)
    @file_with_path = 'data/' + help_user_choose_file(filename)
  end

  def help_user_choose_file(default_file)
    files = Dir.entries('data')
    files.slice!(0,2)
    return default_file if files.include?(default_file)
    choose do |menu|
      menu.prompt = "Please choose which file you would like use:"
      files.each { |file| menu.choice(file) }
    end
  end

  def each_row(&block)
    CSV.foreach(@file_with_path) do |row|
      block.call(row)
    end
  end
end
