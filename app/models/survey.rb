class Survey < ActiveRecord::Base
  
  belongs_to :family, :class_name => 'FamilyProfile', :dependent => :destroy
  accepts_nested_attributes_for :family
  has_many :children, :class_name => 'ChildProfile', :dependent => :destroy
  has_many :children_at_home, :class_name => 'ChildProfile'
  has_many :children_above_three_and_bellow_seven, :class_name => 'ChildProfile', :include => :survey, :conditions => 'date_of_birth < DATE_SUB(surveys.date_of_the_interview, INTERVAL 1095 DAY) and date_of_birth > DATE_SUB(surveys.date_of_the_interview, INTERVAL 2920 DAY)'
  
  has_many :children_above_five_and_bellow_seven, :class_name => 'ChildProfile', :include => :survey, :conditions => 'date_of_birth < DATE_SUB(surveys.date_of_the_interview, INTERVAL 1826 DAY) and date_of_birth > DATE_SUB(surveys.date_of_the_interview, INTERVAL 2920 DAY)'
  
  # 'date_of_birth<"2005-09-01" and date_of_birth>"2003-08-31"'
  
  has_many :children_below_seven, :class_name => 'ChildProfile', :include => :survey, :conditions => 'date_of_birth > DATE_SUB(surveys.date_of_the_interview, INTERVAL 2920 DAY)'
  # , :conditions => ' date_of_birth>"2003-08-31"'

  has_many :children_below_3, :class_name => 'ChildProfile', :include => :survey, :conditions => 'date_of_birth > DATE_SUB(surveys.date_of_the_interview, INTERVAL 1095 DAY)'
  # , :conditions => 'date_of_birth>"2007-08-31"'
  
  accepts_nested_attributes_for :children
  accepts_nested_attributes_for :children_above_three_and_bellow_seven
  accepts_nested_attributes_for :children_below_seven
  
  has_one :kindergarten, :class_name => 'Institution'
  belongs_to :locality
  belongs_to :mediator, :class_name => 'User', :foreign_key => 'interviewer_id', :conditions => {:category => ['MED','L','LDB']}
  
  scope :genders, MenuItem.where(:category => 'gender', :enabled => 1)
  
  #  validates_presence_of :mediator, :locality, :number_of_all_children, :number_of_children_below_seven, :mediator_survey_counter
  
  def child_above_3_below_7_attending_creche
    children_above_three_and_bellow_seven.find(:all,
                      :joins  => :institution,
                      :conditions => 'institutions.code_id=105'
                )
  end
  
  def child_above_3_below_7_not_attending_creche
    children_above_three_and_bellow_seven.find(:all,
                      :joins  => :institution,
                      :conditions => 'institutions.code_id<>104 and institutions.code_id<>105 and institutions.code_id<>107 and institutions.code_id<>108'
                )
  end

  def child_above_5_below_7_not_attending_creche
    children_above_five_and_bellow_seven.find(:all,
                      :joins  => :institution,
                      :conditions => 'institutions.code_id=107 or institutions.code_id=108'
                )
  end

  def child_bellow_3_attending_creche
    children_below_3.where('institution_id<>51')
  end
  
  def child_bellow_3_at_home
    children_below_3.where(:institution_id => 51)
  end

  def number
    mediator.blank? ? mcode='NOUSER' : mcode=mediator.code
    locality.blank? ? lcode='NOLOCALITY' : lcode=locality.code
    "#{lcode}" "-" "#{mcode}" "-" "#{mediator_survey_counter}"
  end
  

  def number_of_children_below_three
    self.children.where('date_of_birth > DATE_SUB(surveys.date_of_the_interview, INTERVAL 1095 DAY)', :include => :survey)
  end

  def number_of_children_above_three_and_bellow_seven
    self.children.where('date_of_birth < DATE_SUB(surveys.date_of_the_interview, INTERVAL 1095 DAY) and date_of_birth > DATE_SUB(surveys.date_of_the_interview, INTERVAL 2920 DAY)', :include => :survey)
  end

  def self.columns_for_output
    ["family_id", "locality_id", "date_of_the_interview", "duration_of_interview", "interviewer_id",
       # "household_address_street", "household_address_city", "household_address_country", "household_address_zip", 
       "number_of_all_children", "number_of_children_below_seven", 
       "comment", 
       "relation_to_children", "relation_to_children_other", "primary_caregiver", "who_is_primary_caregiver", "who_is_primary_caregiver_other", "primary_caregiver_age", 
       "language_hungarian", "language_macedonian", "language_romani", "language_romanian", "language_slovak", "language_other", "language_albanian", 
        "children_language_hungarian", "children_language_macedonian", "children_language_romani", "children_language_romanian", "children_language_slovak", "children_language_other", "children_language_albanian", 
        "better_in_school", "kindergarten_importance", 
        "wished_daugters_education", "wished_daugters_education_other", "wished_sons_education", "wished_sons_education_other",
         "boys_girls_success_importance", 
         "immunization_importance", "immunization_in_household", "immunization_information_source_doctor", "immunization_information_source_nurse", "immunization_information_source_mediator", "immunization_information_source_no_info", "immunization_information_source_do_not_know", "immunization_information_source_nurse_other", 
         "visited_hospital_during_pregnancy", "talked_about_pregnancy", "talked_about_pregnancy_other", "doctor_visit_after_birth", "breastfeeding_importance", 
         "childs_development_information_source_no_need", "childs_development_information_source_books", "childs_development_information_source_newspapers", "childs_development_information_source_tv", "childs_development_information_source_other_persons", "childs_development_information_source_others", "childs_development_information_source_no_idea", 
         "book_reading_mother", "book_reading_father", "book_reading_other", "book_reading_noone", "book_reading_no_answer", 
         "tell_stories_mother", "tell_stories_father", "tell_stories_other", "tell_stories_noone", "tell_stories_no_answer", 
         "play_mother", "play_father", "play_other", "play_noone", "play_no_answer", 
         "draw_mother", "draw_father", "draw_other", "draw_noone", "draw_no_answer", 
         "teach_letters_mother", "teach_letters_father", "teach_letters_other", "teach_letters_noone", "teach_letters_no_answer", 
         "homework_mother", "homework_father", "homework_other", "homework_noone", "homework_no_child_in_school_yet", "homework_no_answer", 
         "book_count", "separate_place", 
         "reason_for_creche_likes", "reason_for_creche_free_meal", "reason_for_creche_time", "reason_for_creche_trust", "reason_for_creche_friendships", "reason_for_creche_playing", "reason_for_creche_learning", "reason_for_creche_language", "reason_for_creche_no_answer", "reason_for_creche_other", 
         "talk_with_teacher", 
         "reason_not_attend_expensive", "reason_not_attend_no_creche", "reason_not_attend_no_place", "reason_not_attend_no_work", "reason_not_attend_no_trust", "reason_not_attend_bad_treating", "reason_not_attend_language", "reason_not_attend_family", "reason_not_attend_no_answer", "reason_not_attend_other", 
         "reason_for_kindergarten_likes", "reason_for_kindergarten_free_meal", "reason_for_kindergarten_time", "reason_for_kindergarten_trust", "reason_for_kindergarten_friendships", "reason_for_kindergarten_better_chance", "reason_for_kindergarten_playing", "reason_for_kindergarten_learning", "reason_for_kindergarten_language", "reason_for_kindergarten_compulsory", "reason_for_kindergarten_other", "reason_for_kindergarten_no_answer", 
         "kindergarten_days", "kindergarten_roma", "class_roma", "teacher_informs", "lesson_language_understanding", "teacher_help",
         "reason_not_enrolled_no_like", "reason_not_enrolled_expensive", "reason_not_enrolled_no_clothes", "reason_not_enrolled_no_work", "reason_not_enrolled_trust", "reason_not_enrolled_children_treating", "reason_not_enrolled_not_nearby", "reason_not_enrolled_no_place", "reason_not_enrolled_family", "reason_not_enrolled_language", "reason_not_enrolled_other", "reason_not_enrolled_no_answer", 
         "school_roma", "school_class_roma", "school_teacher_information", "lesson_difficulty", "are_teachers_helpfull", "school_good_bad",
         "test_before_school", "test_before_school_result", "test_before_school_other", 
         "school_mother", "school_mother_other", "school_father", "school_father_other", "school_caregiver", "school_caregiver_other",
          "mother_has_id", "birth_certificate", 
          "home_kitchen", "home_toilet", "home_latrine", "home_sewerage", "home_shower", "home_water", "home_electricity", "home_tv", "home_phone", "home_radio", "home_computer", "home_internet", 
          "number_of_people_under_18", "number_of_people_over_18", 
          "mother_activity", "mother_activity_other", "father_activity", "father_activity_other", "caregiver_activity", "caregiver_activity_other", 
          "separated_settlement", "roma_village", 
          "mediator_id", "mediator_survey_counter", 
          "fathers_age", "mothers_age", 
          "talked_about_pregnancy_doctor", "talked_about_pregnancy_nurse", "talked_about_pregnancy_community_mediator", "talked_about_pregnancy_health_mediator", "talked_about_pregnancy_noone", "talked_about_pregnancy_no_answer", 
          "marked_for_delete", "roma", "mothers_age_at_first_pregnancy", 
          "created_by", "verified", "created_at", "updated_at", "completed"] 
  end
end
