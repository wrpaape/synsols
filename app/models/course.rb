class Course < ActiveRecord::Base
  has_many :participants, dependent: :destroy
  has_many :employees, through: :participants, dependent: :destroy
  belongs_to :location, counter_cache: true
end
