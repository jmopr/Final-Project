# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
require 'gender_detector'

department_data = []
job_data = []
csv_text1 = File.read('2016-salaries.csv')
csv1 = CSV.parse(csv_text1, :headers => true)
csv1.each do |row|
  unless department_data.include?(row[-1])
    Department.create(name: row[-1])
    department_data << row[-1]
  end
  unless job_data.include?(row[1])
    JobTitle.create(title: row[1])
    job_data << row[1]
  end
end


  # def guess_gender
      # d = GenderDetector.new
      # @name = params[:name]
      # guessed_gender = d.get_gender(@name)
      # guessed_gender = d.get_gender("Maria")
      # render json: {name: @name, gender = guessed_gender}
      # p guessed_gender
    # end

# CSV.foreach('2016-salaries.csv') do |row|
#    unless department_data.include?(row[-1])
#      Department.create(name: row[-1])
#      department_data << row[-1]
#    end
# end
gender = GenderDetector.new
csv_text2 = File.read('2016-salaries.csv')
csv2 = CSV.parse(csv_text2, :headers => true)
csv2.each do |row|
  name = row[0].split(',')[1].strip.split(' ')[0].capitalize
  Employee.create(name: row[0], salary: row[4].gsub(/[$,]/,'').strip.to_f,
                  gender: gender.get_gender(name), data_year: 2016,
                  department_id: Department.find_by(name: row[-1]).id,
                  job_title_id: JobTitle.find_by(title: row[1]).id)
end
