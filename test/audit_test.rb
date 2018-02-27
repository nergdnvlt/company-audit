require './test/test_helper'
require './lib/audit'

class CompanyTest < Minitest::Test
  def setup
    @audit = Audit.new
  end

  def test_it_exists
    assert_instance_of Audit, @audit
  end

  def test_add_objects
    company = Company.new
    company.load_employees('./data/employees.csv')
    company.load_projects('./data/projects.csv')
    company.load_timesheets('./data/timesheets.csv')
    @audit.load_company(company)

    assert_instance_of Employee, audit.company.employees.first
    assert_instance_of Project, audit.company.employees.first
  end
end
