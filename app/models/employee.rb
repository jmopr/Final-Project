class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :job_title

  scope :females, -> { where(gender: :female) }
  scope :males, -> { where(gender: :male) }
  scope :all_employees, -> (year) { where(data_year: year) }
  scope :top_ten_salaries, -> { order(salary: :desc).limit(10) }

  # Return the total for all departments.
  def self.get_budgets(year)
    total_budget = []
    departments = Department.all
    departments.each do |department|
      dept_info = {}
      dept_budget = 0
      employees_department = Employee.where(data_year: year, department_id: department.id)
      employees_department.each do |employee|
        dept_budget += employee.salary
      end
      dept_info = {name: department.name, y: dept_budget.to_f}
      total_budget << dept_info
    end
    return total_budget
  end

  # Returns a hash with the necessary data.
  def self.get_all_data
    data = []
    year = 2012
    while (year <= 2016)
      data << get_data_for_year(year).merge({year: year})
      year += 1
    end
    return data
  end

  # Returns an array of hashes with the average salary for both genders.
  def self.get_data_for_year(year)
    return {
      men: all_employees(year).males.average(:salary).round(2),
      women: all_employees(year).females.average(:salary).round(2)
    }
  end
end
