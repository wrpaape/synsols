class Participant < ActiveRecord::Base
  belongs_to :employee
  belongs_to :course
  after_create :increment_courses_counter_cache, :increment_employees_counter_cache
  after_destroy :decrement_courses_counter_cache, :decrement_employees_counter_cache

  private

  def increment_courses_counter_cache
    Course.increment_counter( 'employees_count', self.course.id )
  end

  def decrement_courses_counter_cache
    Course.decrement_counter( 'employees_count', self.course.id )
  end

  def increment_employees_counter_cache
    Employee.increment_counter( 'courses_count', self.employee.id )
  end

  def decrement_employees_counter_cache
    Employee.decrement_counter( 'courses_count', self.employee.id )
  end
end
