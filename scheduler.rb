require 'highline/import'
require 'pry'
require 'csv'
require 'date'
require "active_support/core_ext"
require 'terminal-table'

Dir[File.dirname(__FILE__) + '/domain/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

class Scheduler
  attr_reader :positions, :volunteers, :days, :schedule

  def initialize()
    @positions  = Collection.new
    @volunteers = Collection.new
    @days       = Collection.new
    read_volunteers_and_positions_from_file
    get_bounds_for_schedule
    @schedule = Schedule.new(@days, @positions, @volunteers)
  end

  def read_volunteers_and_positions_from_file
    reader = CsvReader.new('volunteers.csv')
    reader.each_row do |positions|
      name = positions.slice!(0)

      if name == "Volunteer"
        positions.each {|p| @positions.add Position.new(p)}
      else
        @volunteers.add Volunteer.new(name, positions, self)
      end
    end
  end

  def get_bounds_for_schedule
    start_date = MonthChooser.choose_month('Choose first month of schedule: ')
    length = ask("How many months do you want to schedule? ", Integer)
    end_date = (start_date + (length - 1).months).at_end_of_month

    say("Your schedule will be from #{start_date.strftime('%B %Y')} to #{end_date.strftime('%B %Y')}")
    puts

    sundays = (start_date..end_date).select {|d| [0].include?(d.wday)}
    sundays.each {|s| @days.add Day.new(s, @positions.count)}
  end
end

scheduler = Scheduler.new
Tabler.output scheduler
