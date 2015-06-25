class Course < ActiveRecord::Base
  has_many :participants
  has_many :employees, through: :participants
  belongs_to :location, counter_cache: true
  after_create :increment_company_counter_cache, :increment_employees_counter_cache
  after_destroy :decrement_company_counter_cache, :decrement_employees_counter_cache

  private

  def increment_company_counter_cache
    Company.increment_counter( 'courses_count', self.location.company.id )
  end

  def decrement_company_counter_cache
    Company.decrement_counter( 'courses_count', self.location.company.id )
  end

  def increment_employees_counter_cache
    self.employees.each do |employee|
      Employee.increment_counter( 'courses_count', employee.id )
    end
  end

  def decrement_employees_counter_cache
    self.employees.each do |employee|
      Employee.decrement_counter( 'courses_count', employee.id )
    end
  end
end
