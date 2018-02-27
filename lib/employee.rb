require './modules/date_handler'
# Instantiates an employee object
class Employee
  attr_reader :employee_id,
              :name,
              :role,
              :start_date,
              :end_date

  def initialize(employee_id, name, role, start_date, end_date)
    @employee_id = employee_id.to_i
    @name = name
    @role = role
    @start_date = string_date_input(start_date)
    @end_date = string_date_input(end_date)
  end

  def string_date_input(date_string)
    DateHandler.string_to_date(date_string)
  end
end
