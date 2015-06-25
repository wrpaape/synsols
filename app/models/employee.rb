class Employee < ActiveRecord::Base
  has_many :participants, dependent: :destroy
  has_many :courses, through: :participants, dependent: :destroy
  belongs_to :company
  belongs_to :location
end
