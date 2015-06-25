class Employee < ActiveRecord::Base
  has_many :participants
  has_many :courses through :participants
  belongs_to :location
end
