class Employee


  attr_accessor :salary, :name, :title, :boss

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

end


class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss=nil, employees=[])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    multiplier * self.total_salary_of_subordinates
  end

  def total_salary_of_subordinates
    result = 0
    self.employees.each do |employee|
      result += employee.total_salary_of_subordinates if employee.is_a?(Manager)
      result += employee.salary
    end
    result
  end

end
