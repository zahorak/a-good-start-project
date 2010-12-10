class ChildProfile < ActiveRecord::Base
  belongs_to :family, :class_name => 'FamilyProfile'
  belongs_to :survey
  accepts_nested_attributes_for :survey
  belongs_to :enrolled_to, :class_name => 'Institution', :foreign_key => 'institution_id'
  has_many :attendances
  has_many :attendance_results
  
  def full_name
    "#{childs_first_name}" " " "#{childs_last_name}"
  end
  
  def full_gender
    if gender == 111
      I18n.t('female')
    else
      I18n.t('male')
    end
  end
end