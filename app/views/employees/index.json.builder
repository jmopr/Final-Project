json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :salary, :data_year
  json.message I18n.t('employee_message', name: employee.name)
end 
