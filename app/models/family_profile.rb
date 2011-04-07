class FamilyProfile < ActiveRecord::Base
  has_many :children, :class_name => 'ChildProfile', :foreign_key => :family_id
  belongs_to :survey
  accepts_nested_attributes_for :survey
  belongs_to :creator, :foreign_key => :created_by, :class_name => 'User'
  has_many :surveys, :foreign_key => :family_id
#  validates_presence_of :number_of_children
  
  def full_household_in_settlement
    if household_in_settlement == 1
      'yes'
    else
      'no'
    end
  end

  def self.columns_for_output
    ["survey_id", "family_name", "non_formal_education", "workshops_on_education", "parental_involment_in_preschool"] 
  end
end
