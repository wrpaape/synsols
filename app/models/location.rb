class Location < ActiveRecord::Base
  has_many :employees, dependent: :destroy
  has_many :courses, dependent: :destroy
  belongs_to :company, counter_cache: true
end
