class FamilyProfile < ActiveRecord::Base
  has_many :children, :class_name => 'ChildProfile'
  belongs_to :survey
  accepts_nested_attributes_for :survey
  
#  validates_presence_of :number_of_children
  
  def full_household_in_settlement
    if household_in_settlement == 1
      'yes'
    else
      'no'
    end
  end

end
