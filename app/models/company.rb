class Company < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :courses, through: :locations, dependent: :destroy
end
