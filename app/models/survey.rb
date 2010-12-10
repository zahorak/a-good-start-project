class Survey < ActiveRecord::Base
  
  #belongs_to :family_profile
  belongs_to :family, :class_name => 'FamilyProfile'
  accepts_nested_attributes_for :family
  has_many :children, :class_name => 'ChildProfile'
  has_many :children_above_three_and_bellow_seven, :class_name => 'ChildProfile', :conditions => 'date_of_birth<"2007-09-01" and date_of_birth>"2003-08-31"'
  has_many :children_below_seven, :class_name => 'ChildProfile', :conditions => ' date_of_birth>"2003-08-31"'
  
  accepts_nested_attributes_for :children
  accepts_nested_attributes_for :children_above_three_and_bellow_seven
  accepts_nested_attributes_for :children_below_seven
  
  has_one :kindergarten, :class_name => 'Institution'
  belongs_to :locality
  belongs_to :mediator, :class_name => 'User', :foreign_key => 'interviewer_id'
  
#  validates_presence_of :mediator, :locality, :number_of_all_children, :number_of_children_below_seven, :mediator_survey_counter
  
  def number
    mediator.blank? ? code='NOUSER' : code=mediator.code
    unless locality_id.blank?
      "#{locality.code}" "-" "#{mediator.code}" "-" "#{mediator_survey_counter}"
    else
      ''
    end
  end
  

  def number_of_children_below_three
    self.children.where('date_of_birth<"2007-09-01"')
  end

  def number_of_children_above_three_and_bellow_seven
    self.children.where('date_of_birth>"2007-09-01" and date_of_birth<"2003-09-01"')
  end

end
