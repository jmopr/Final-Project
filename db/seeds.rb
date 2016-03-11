require 'csv'
require 'gender_detector'
require 'with_probability'

# count = 1
# while count <= 5
  # Change to 2012 after tests ###
  data_year = 2016
  department_data = []
  job_data = []
  csv_text1 = File.read('2016-salaries.csv')
  csv1 = CSV.parse(csv_text1, :headers => true)
  csv1.each do |row|
    department = row["Department"]  #.split.map(&:capitalize).join(" ")
    unless department_data.include?(department)
      Department.create(name: department)
      department_data << department
    end

    title = row["TITLE"]  #.split.map(&:capitalize).join(" ")
    unless job_data.include?(title)
      JobTitle.create(title: title,
                      department_id: Department.find_by(name: department).id)
      job_data << title
    end
    # byebug
  end

  def gender_guesser
    # Assign a 51.4% of total data to female.
    # Assign a 48.6% of total data to male.
    with_probability(0.514) do
      return :female
    end
    return :male
  end

  employee_data = []
  gender = GenderDetector.new
  csv_text2 = File.read('2016-salaries.csv')
  csv2 = CSV.parse(csv_text2, :headers => true)
  csv2.each do |row|
    name = row[0].split(',')[1].strip.split(' ')[0].capitalize
    name_gender = gender.get_gender(name)
    if name_gender == :mostly_female
      name_gender = :female
    elsif name_gender == :mostly_male
      name_gender = :male
    elsif name_gender == :andy
      name_gender = gender_guesser
    end

    row_name = row["NAME"]
    unless employee_data.include?(row_name)
      Employee.create(name: row_name,
                      salary: row[4].gsub(/[$,]/,'').strip.to_f,
                      gender: name_gender, data_year: data_year,
                      department_id: Department.find_by(name: row["Department"]).id,
                      job_title_id: JobTitle.find_by(title: row["TITLE"]).id)
      employee_data << row_name
    end
  end
  # data_year += 1
  # count += 1
# end
