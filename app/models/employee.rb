class Employee < ActiveRecord::Base
  has_many :participants, dependent: :destroy
  has_many :courses, through: :participants, dependent: :destroy
  belongs_to :company, counter_cache: true
  belongs_to :location, counter_cache: true
end
