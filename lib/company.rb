require 'csv'
require './lib/employee'
# Creates and instance of company to hold other objects
class Company
  attr_reader :employees, :projects, :timesheets

  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(filepath)
    rows = []
    CSV.foreach(filepath) do |row|
      rows << row.length
    end
    result = rows.map do |num|
      num == 5
    end
    return { success: false, error: 'bad data' } if result.include?(false)
    { success: true, error: nil }
  end

  def load_projects(filepath)
    rows = []
    CSV.foreach(filepath) do |row|
      rows << row.length
    end
    result = rows.map do |num|
      num == 4
    end
    return { success: false, error: 'bad data' } if result.include?(false)
    { success: true, error: nil }
  end

  def test_load_timesheets(filepath)
    rows = []
    CSV.foreach(filepath) do |row|
      rows << row.length
    end
    result = rows.map do |num|
      num == 4
    end
    return { success: false, error: 'bad data' } if result.include?(false)
    { success: true, error: nil }
  end
end
