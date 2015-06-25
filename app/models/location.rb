class Location < ActiveRecord::Base
  has_many :employees
  has_many :courses
  belongs_to :company
end
