class MenuItem < ActiveRecord::Base
  attr_accessor :full_name
  #has_foreign_language :name
  scope :genders, MenuItem.where(:category => 'gender')
  scope :frequency, MenuItem.where(:category => 'frequency')
  scope :relatives, MenuItem.where(:category => 'relative')
  scope :better_in_school, MenuItem.where(:category => 'better_in_school')
  scope :importance, MenuItem.where(:category => 'importance')
  scope :wished_education, MenuItem.where(:category => 'wished_education')
  scope :success_importance, MenuItem.where(:category => 'success_importance')
  scope :quantity, MenuItem.where(:category => 'quantity')
  scope :classic, MenuItem.where(:category => 'classic')
  scope :talked_about_pregnancy, MenuItem.where(:category => 'talked_about_pregnancy')
  scope :classic_extended, MenuItem.where(:category => 'classic_extended')
  scope :classic_reduced, MenuItem.where(:category => 'classic_reduced')
  scope :frequency_extended, MenuItem.where(:category => 'frequency_extended')
  scope :roma, MenuItem.where(:category => 'roma')
  scope :language_understanding, MenuItem.where(:category => 'language_understanding')
  scope :language_difficulties, MenuItem.where(:category => 'language_difficulties').order(:position)
  scope :good_bad, MenuItem.where(:category => 'good_bad')
  scope :test_result, MenuItem.where(:category => 'test_result')
  scope :school_type, MenuItem.where(:category => 'school_type')
  scope :birth_certificate, MenuItem.where(:category => 'birth_certificate')
  scope :activities, MenuItem.where(:category => 'activity').order(:position)
  scope :institution_codes, MenuItem.where(:category => 'institution_code')
  scope :institution_codes_limited, MenuItem.where("category='institution_code' and id <> 102")

    # def name=(name)
    #   write_attribute(:name,"#{name_}"+I18n.locale)
    #   read_attribute(:name,"#{name_}"+I18n.locale)
    # end
    def after_initialize
      self.full_name = self.send("name_"+I18n.locale.to_s)
    end
end
