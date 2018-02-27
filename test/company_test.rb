require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test
  def test_it_exists
    company = Company.new

    assert_instance_of Company, company
  end

  def test_it_holds_empty_collections
    company = Company.new
    assert_equal [], company.employees
    assert_equal [], company.projects
    assert_equal [], company.timesheets
  end

  def test_load_employees
    company = Company.new
    company.load_employees('./data/employees.csv')

    assert_instance_of Employee, company.employees.first
    require "pry"; binding.pry
  end
end
