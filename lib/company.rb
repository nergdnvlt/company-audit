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

  def check_success_employee(filepath)
    CSV.foreach(filepath) do |row|
      return 'Error: bad file' if row.length != 5
      return 'success' if row.length == 5
    end
  end

  def load_employees(filepath)
    if check_success_employee(filepath) == 'success'
      CSV.foreach(filepath) do |row|
        @employees << { id: row[0],
                        name: row[1],
                        role: row[2],
                        start_date: row[3],
                        end_date: row[4] }
      end
    else
      check_success_employee(filepath)
    end
  end

  def check_success_project(filepath)
    CSV.foreach(filepath) do |row|
      return result = 'success' if row.length == 4
      return result =  'Error: bad file' if row.length != 4
    end
    result
  end

  def load_projects(filepath)
    if check_success_project(filepath) == 'success'
      CSV.foreach(filepath) do |row|
        @projects << { project_id: row[0],
                       name: row[1],
                       start_date: row[2],
                       end_date: row[3] }
      end
    else
      check_success_project(filepath)
    end
  end
end

# @employees << Employee.new(row[0], row[1], row[2], row[3], row[4])
