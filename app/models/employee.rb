class Employee < ActiveRecord::Base
  has_many :participants, dependent: :destroy
  has_many :courses, through: :participants, dependent: :destroy
  belongs_to :company, counter_cache: true
  belongs_to :location, counter_cache: true
  after_create :increment_courses_counter_cache
  after_destroy :decrement_courses_counter_cache

  private

  def increment_courses_counter_cache
    self.courses.each do |course|
      Course.increment_counter( 'courses_count', course.id )
    end
  end

  def decrement_courses_counter_cache
    self.courses.each do |course|
      Course.decrement_counter( 'courses_count', course.id )
    end
  end
end
