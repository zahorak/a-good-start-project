class SchoolResult < ActiveRecord::Base
  belongs_to :child, :class_name => "ChildProfile"
  belongs_to :institution
end
