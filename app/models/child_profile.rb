class ChildProfile < ActiveRecord::Base
  belongs_to :family, :class_name => 'FamilyProfile', :foreign_key => :family_id
  belongs_to :survey
  accepts_nested_attributes_for :survey
  belongs_to :enrolled_to, :class_name => 'Institution', :foreign_key => 'institution_id'
  has_many :attendances
  has_many :attendance_results, :foreign_key => :child_id, :order => "attendance_period desc" 
  belongs_to :institution
  belongs_to :creator, :foreign_key => :created_by, :class_name => 'User'
  has_many :immunizations, :foreign_key => :child_id
  has_many :school_results, :foreign_key => "child_id"
  
  def full_name
    "#{childs_first_name}" " " "#{childs_last_name}"
  end
  
  def full_name_reversed
    "#{childs_last_name}" " " "#{childs_first_name}"
  end
  
  def full_gender
    if gender == 111
      I18n.t('female')
    else
      I18n.t('male')
    end
  end
  
  def self.columns_for_output
    ["survey_id", "family_id", "childs_first_name", "childs_last_name", "date_of_birth", "gender", "institution_id"]
    #, "alphabet", "reading_words", "writing", "sentences", "numbers", "buttons", "routine_activities", "selfconfidence", "other_children", "created_at", "updated_at", "marked_for_delete"
  end
end