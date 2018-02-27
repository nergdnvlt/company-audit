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

  def check_success(filepath)
    CSV.foreach(filepath) do |row|
      return 'Error: bad file' if row.length != 5
      return 'success' if row.length == 5
    end
  end

  def load_employees(filepath)
    if check_success(filepath) == 'success'
      CSV.foreach(filepath) do |row|
        data = { id: row[0], name: row[1], start_date: row[2], end_date: row[3] }
        @employees << data
      end
    else
      puts check_success(filepath)
      check_success(filepath)
    end
  end

  def load_projects(filepath)
    if check_success(filepath) == 'success'
      CSV.foreach(filepath) do |row|
        data = { project_id: row[0], name: row[1], start_date: row[2], end_date: row[3] }
        @employees << data
      end
    else
      puts check_success(filepath)
      check_success(filepath)
    end
  end
end

# @employees << Employee.new(row[0], row[1], row[2], row[3], row[4])
