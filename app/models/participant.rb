class Participant < ActiveRecord::Base
  belongs_to :employee
  belongs_to :course
end
