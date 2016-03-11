class Department < ActiveRecord::Base
  has_many :employees
  has_many :job_titles
end
