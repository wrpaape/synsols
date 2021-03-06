class Course < ActiveRecord::Base
  has_many :participants
  has_many :employees, through: :participants
  belongs_to :company, counter_cache: true
  belongs_to :location, counter_cache: true
end
