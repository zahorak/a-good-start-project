class AttendanceResult < ActiveRecord::Base
  belongs_to :child_profile, :foreign_key => :child_id
  
  
end
