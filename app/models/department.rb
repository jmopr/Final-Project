class Department < ActiveRecord::Base
  has_many :employees
  has_many :job_titles
  
  # Returns a hash with the necessary data.
  def self.get_all_data(department_id)
    data = []
    year = 2012
    while (year <= 2016)
      data << get_data_for_year(year, department_id).merge({year: year})
      year += 1
    end
    return data
  end

  # Returns an array of hashes with the average salary for both genders.
  def self.get_data_for_year(year, department_id)
    return {
      men: average_salary_men(year, department_id).round(2),
      women: average_salary_women(year, department_id).round(2)
    }
  end

  # Returns the average salary for men for a particular department in a particular year.
  def self.average_salary_men(year, department_id)
    @men = Employee.where(department_id: department_id, data_year: year, gender: :male)
    men_salary = 0
    @men.each do |man|
      men_salary += man.salary
    end
    @men.count != 0 ? (men_salary / @men.count) : 0
  end

  # Returns the average salary for women for a particular department in a particular year.
  def self.average_salary_women(year, department_id)
    @women = Employee.where(department_id: department_id, data_year: year, gender: :female)
    women_salary = 0
    @women.each do |woman|
      women_salary += woman.salary
    end
    @women.count != 0 ? (women_salary / @women.count) : 0
  end
end
