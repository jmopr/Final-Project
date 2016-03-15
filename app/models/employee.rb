class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :job_title

  # Returns the amount of female employees in the county.
  def self.get_females(year)
    Employee.where(data_year: year, gender: :female).count
  end

  # Returns the amount of male employees in the county.
  def self.get_males(year)
    Employee.where(data_year: year, gender: :male).count
  end

  # Returns the amount of employees in the county.
  def self.get_all_employees(year)
    Employee.where(data_year: year).count
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
      men: average_salary_men(year).round(2),
      women: average_salary_women(year).round(2)
    }
  end

  # Returns the average salary for men for a particular year.
  def self.average_salary_men(year)
    @men = Employee.where(data_year: year, gender: :male)
    men_salary = 0
    @men.each do |man|
      men_salary += man.salary
    end
    @men.count != 0 ? (men_salary / @men.count) : 0
  end

  # Returns the average salary for women for a particular year.
  def self.average_salary_women(year)
    @women = Employee.where(data_year: year, gender: :female)
    women_salary = 0
    @women.each do |woman|
      women_salary += woman.salary
    end
    @women.count != 0 ? (women_salary / @women.count) : 0
  end
end
