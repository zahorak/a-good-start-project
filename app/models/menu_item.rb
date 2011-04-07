class MenuItem < ActiveRecord::Base
  attr_accessor :full_name
  #has_foreign_language :name
  scope :genders, MenuItem.where(:category => 'gender', :enabled => 1)
  scope :frequency, MenuItem.where(:category => 'frequency', :enabled => 1)
  scope :relatives, MenuItem.where(:category => 'relative', :enabled => 1)
  scope :better_in_school, MenuItem.where(:category => 'better_in_school', :enabled => 1)
  scope :importance, MenuItem.where(:category => 'importance', :enabled => 1)
  scope :wished_education, MenuItem.where(:category => 'wished_education', :enabled => 1)
  scope :success_importance, MenuItem.where(:category => 'success_importance', :enabled => 1)
  scope :quantity, MenuItem.where(:category => 'quantity', :enabled => 1)
  scope :classic, MenuItem.where(:category => 'classic', :enabled => 1)
  scope :talked_about_pregnancy, MenuItem.where(:category => 'talked_about_pregnancy', :enabled => 1)
  scope :classic_extended, MenuItem.where(:category => 'classic_extended', :enabled => 1)
  scope :classic_reduced, MenuItem.where(:category => 'classic_reduced', :enabled => 1)
  scope :frequency_extended, MenuItem.where(:category => 'frequency_extended', :enabled => 1)
  scope :frequency_extended2, MenuItem.where(:category => 'frequency_extended2', :enabled => 1)
  scope :roma, MenuItem.where(:category => 'roma', :enabled => 1)
  scope :language_understanding, MenuItem.where(:category => 'language_understanding', :enabled => 1)
  scope :language_difficulties, MenuItem.where(:category => 'language_difficulties', :enabled => 1).order(:position)
  scope :language_difficulties2, MenuItem.where(:category => 'language_difficulties2', :enabled => 1).order(:position)
  scope :good_bad, MenuItem.where(:category => 'good_bad', :enabled => 1)
  scope :test_result, MenuItem.where(:category => 'test_result', :enabled => 1)
  scope :school_type, MenuItem.where(:category => 'school_type', :enabled => 1)
  scope :birth_certificate, MenuItem.where(:category => 'birth_certificate', :enabled => 1)
  scope :activities, MenuItem.where(:category => 'activity', :enabled => 1).order(:position)
  scope :institution_codes, MenuItem.where(:category => 'institution_code', :enabled => 1)
  scope :institution_codes_limited, MenuItem.where("category='institution_code' and id <> 102 and enabled=1")
  scope :immunization, MenuItem.where(:category=>'immunization').order(:position)
  scope :school_result_tests, MenuItem.where(:category=>'school_result_test').order(:position)

    # def name=(name)
    #   write_attribute(:name,"#{name_}"+I18n.locale)
    #   read_attribute(:name,"#{name_}"+I18n.locale)
    # end
    def after_initialize
      self.full_name = self.send("name_"+I18n.locale.to_s)
    end
end
