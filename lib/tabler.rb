class Tabler
  def self.output(scheduler)
    rows = []
    rows << [''] + scheduler.positions.collect(&:name)
    positions_count = scheduler.positions.count
    scheduler.days.each do |day|
      rows << Array.new(positions_count) do |i|
        day.strftime('%b %e') if i == 0
      end
    end
    table = Terminal::Table.new :rows => rows
    puts table
  end
end
