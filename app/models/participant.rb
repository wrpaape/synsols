class Participant < ActiveRecord::Base
  belongs_to :employee, counter_cache: true
  belongs_to :course, counter_cache: true
end
