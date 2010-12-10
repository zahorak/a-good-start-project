class Attendance < ActiveRecord::Base
  belongs_to :child, :class_name => 'ChildProfile'
end
