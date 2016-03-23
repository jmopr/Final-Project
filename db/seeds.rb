require 'csv'
require 'gender_detector'
require 'with_probability'

data_year = 2012
department_data = []
job_data = []
employee_data = []
gender = GenderDetector.new

while data_year <= 2016
  csv_text1 = File.read("#{data_year}-salaries.csv")
  csv1 = CSV.parse(csv_text1, :headers => true)
  puts "processing department and job title data....."
  csv1.each do |row|
    department = row["DEPARTMENT"].split.map(&:capitalize).join(" ")
    unless department_data.include?(department)
      Department.create(name: department)
      department_data << department
    end

    title = row["TITLE"].split.map(&:capitalize).join(" ")
    unless job_data.include?(title)
      JobTitle.create(title: title,
                      department_id: Department.find_by(name: department).id)
      job_data << title
    end
  end

  def gender_guesser
    with_probability(0.514) do
      return :female
    end
    return :male
  end

  csv_text2 = File.read("#{data_year}-salaries.csv")
  csv2 = CSV.parse(csv_text2, :headers => true)
    puts "processing employee data....."
  csv2.each do |row|
    name = row[0].split(',')[1].strip.split(' ')[0].capitalize
    name_gender = gender.get_gender(name, :usa)
    if name_gender == :mostly_female
      name_gender = :female
    elsif name_gender == :mostly_male
      name_gender = :male
    elsif name_gender == :andy
      name_gender = gender_guesser
    end

    if data_year == 2016
      salary = (row["YTD GROSS"].gsub(/[$,]/,'').strip.to_f * BigDecimal(4))
    else
      salary = row['YTD GROSS'].gsub(/[$,]/,'').strip.to_f
    end
    row_name = row["NAME"]
    department = row["DEPARTMENT"].split.map(&:capitalize).join(" ")
    title = row["TITLE"].split.map(&:capitalize).join(" ")
    unless employee_data.include?(row_name)
      Employee.create(name: row_name, salary: salary,
                      gender: name_gender, data_year: data_year,
                      department_id: Department.find_by(name: department).id,
                      job_title_id: JobTitle.find_by(title: title).id)
      employee_data << row_name
    end
  end
  employee_data = []
  data_year += 1
end
