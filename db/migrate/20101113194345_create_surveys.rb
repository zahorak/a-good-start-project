class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.integer :family_id, :limit => 3
      t.integer :created_by, :limit => 3
      # 1.1
      t.date :date_of_the_interview
      # 1.2
      t.integer :duration_of_interview
      # t.integer :place_of_interview
      t.integer :interviewer_id
      t.string :household_address_street, :limit => 100
      t.string :household_address_city, :limit => 100
      t.string :household_address_country, :limit => 100
      t.string :household_address_zip, :limit => 100
      t.integer :phone_number
      t.integer :number_of_all_children, :limit => 2
      t.integer :number_of_children_below_seven, :limit => 2
      # first page
      t.text :comment, :limit => 3000
      #5.1
      t.integer :relation_to_children, :limit => 1
      t.integer :relation_to_children_other, :limit => 50
      # 5.2
      t.integer :primary_caregiver, :limit => 1
      # 5.3
      t.integer :who_is_primary_caregiver, :limit => 1
      t.integer :who_is_primary_caregiver_other, :limit => 30
      # 5.4
      t.integer :primary_caregiver_age, :limit => 2
      # 5.5
      t.integer :language_hungarian, :limit => 1
      t.integer :language_macedonian, :limit => 1
      t.integer :language_romani, :limit => 1
      t.integer :language_romanian, :limit => 1
      t.integer :language_slovak, :limit => 1
      t.integer :language_other, :limit => 50
      # 5.6
      t.integer :children_language_hungarian, :limit => 1
      t.integer :children_language_macedonian, :limit => 1
      t.integer :children_language_romani, :limit => 1
      t.integer :children_language_romanian, :limit => 1
      t.integer :children_language_slovak, :limit => 1
      t.integer :children_language_other, :limit => 50
      #t.integer :learning_start, :limit => 1
      # 6.1
      t.integer :better_in_school, :limit => 1
      # 6.2
      t.integer :kindergarten_importance, :limit => 1
      #t.integer :local_creche, :limit => 1
      #t.integer :local_kindergarten_quality, :limit => 1
      # 7.1
      t.integer :wished_daugters_education, :limit => 1
      t.text :wished_daugters_education_other, :limit => 500
      # 7.2
      t.integer :wished_sons_education, :limit => 1
      t.text :wished_sons_education_other, :limit => 500
      # 7.3
      t.integer :boys_girls_success_importance, :limit => 1
      # 8.1
      t.integer :immunization_importance, :limit => 1
      # 8.2
      t.integer :immunization_in_household, :limit => 1
      # 8.3
      t.integer :immunization_information_source_doctor
      t.integer :immunization_information_source_nurse
      t.integer :immunization_information_source_mediator
      t.integer :immunization_information_source_no_info
      t.integer :immunization_information_source_do_not_know
      t.text :immunization_information_source_nurse_other, :limit => 300
      #t.integer :hygiene_help, :limit => 1
      # t.integer :pregnancy_check_importance, :limit => 1
      # t.integer :pregnancy_hospital_visit_count, :limit => 1
      # 8.4
      t.integer :visited_hospital_during_pregnancy, :limit => 1
      # 8.5
      t.integer :talked_about_pregnancy, :limit => 1
      t.text :talked_about_pregnancy_other, :limit => 300
      # 8.6
      t.integer :doctor_visit_after_birth, :limit => 1
      # 8.7
      t.integer :breastfeeding_importance, :limit => 1
      # 9.1
      t.integer :childs_development_information_source_no_need
      t.integer :childs_development_information_source_books
      t.integer :childs_development_information_source_newspapers
      t.integer :childs_development_information_source_tv
      t.integer :childs_development_information_source_other_persons, :limit => 150
      t.text :childs_development_information_source_others, :limit => 250
      t.integer :childs_development_information_source_no_idea
      # 9.2
      t.integer :book_reading_mother
      t.integer :book_reading_father
      t.integer :book_reading_other, :limit => 80
      t.integer :book_reading_noone
      # 9.3
      t.integer :tell_stories_mother
      t.integer :tell_stories_father
      t.integer :tell_stories_other, :limit => 80
      t.integer :tell_stories_noone
      # 9.4
      t.integer :play_mother
      t.integer :play_father
      t.integer :play_other, :limit => 80
      t.integer :play_noone
      # 9.5
      t.integer :draw_mother
      t.integer :draw_father
      t.integer :draw_other, :limit => 80
      t.integer :draw_noone
      # 9.6
      t.integer :teach_letters_mother
      t.integer :teach_letters_father
      t.integer :teach_letters_other, :limit => 80
      t.integer :teach_letters_noone
      # 9.7
      t.integer :homework_mother
      t.integer :homework_father
      t.integer :homework_other, :limit => 80
      t.integer :homework_noone
      t.integer :homework_no_child_in_school_yet
      # 9.8
      t.integer :book_count, :limit => 2
      # 9.9
      t.integer :separate_place
      # 10.1
      t.integer :reason_for_creche_likes
      t.integer :reason_for_creche_free_meal
      t.integer :reason_for_creche_time
      t.integer :reason_for_creche_trust
      t.integer :reason_for_creche_friendships
      t.integer :reason_for_creche_playing
      t.integer :reason_for_creche_learning
      t.integer :reason_for_creche_language
      t.integer :reason_for_creche_no_answer
      t.integer :reason_for_creche_other, :limit => 200
      # 10.2
      t.integer :talk_with_teacher, :limit => 1
      # 10.3
      t.integer :reason_not_attend_expensive
      t.integer :reason_not_attend_no_creche
      t.integer :reason_not_attend_no_place
      t.integer :reason_not_attend_no_work
      t.integer :reason_not_attend_no_trust
      t.integer :reason_not_attend_bad_treating
      t.integer :reason_not_attend_language
      t.integer :reason_not_attend_family
      t.integer :reason_not_attend_no_answer
      t.integer :reason_not_attend_other, :limit => 200
      # 11.1
      t.integer :reason_for_kindergarten_likes
      t.integer :reason_for_kindergarten_free_meal
      t.integer :reason_for_kindergarten_time
      t.integer :reason_for_kindergarten_trust
      t.integer :reason_for_kindergarten_friendships
      t.integer :reason_for_kindergarten_better_chance
      t.integer :reason_for_kindergarten_playing
      t.integer :reason_for_kindergarten_learning
      t.integer :reason_for_kindergarten_language
      t.integer :reason_for_kindergarten_compulsory
      t.integer :reason_for_kindergarten_other, :limit => 200
      t.integer :reason_for_kindergarten_no_answer
      # 11.2
      t.integer :kindergarten_days, :limit => 1
      # 11.3
      t.integer :kindergarten_roma, :limit => 1
      # 11.4
      t.integer :class_roma, :limit => 1
      # 11.5
      t.integer :teacher_informs, :limit => 1
      # 11.6
      t.integer :lesson_language_understanding, :limit => 1
      # 11.7
      t.integer :teacher_help, :limit => 1
      # 11.8
      t.integer :reason_not_enrolled_no_like
      t.integer :reason_not_enrolled_expensive
      t.integer :reason_not_enrolled_no_clothes
      t.integer :reason_not_enrolled_no_work
      t.integer :reason_not_enrolled_trust
      t.integer :reason_not_enrolled_children_treating
      t.integer :reason_not_enrolled_not_nearby
      t.integer :reason_not_enrolled_no_place
      t.integer :reason_not_enrolled_family
      t.integer :reason_not_enrolled_language
      t.integer :reason_not_enrolled_other
      t.integer :reason_not_enrolled_no_answer
      # 11.9
      t.integer :school_roma, :limit => 1
      # 11.10
      t.integer :school_class_roma, :limit => 1
      # 11.11
      t.integer :school_teacher_information, :limit => 1
      # 11.12
      t.integer :lesson_difficulty, :limit => 1
      # 11.13
      t.integer :are_teachers_helpfull, :limit => 1
      # 11.14
      t.integer :school_good_bad, :limit => 1
      # 11.15
      t.integer :test_before_school, :limit => 1
      # 11.16
      t.integer :test_before_school_result, :limit => 1
      t.integer :test_before_school_other, :limit => 200
      # 12.1
      t.integer :school_mother, :limit => 1
      t.integer :school_mother_other, :limit => 200
      t.integer :school_father, :limit => 1
      t.integer :school_father_other, :limit => 200
      t.integer :school_caregiver, :limit => 1
      t.integer :school_caregiver_other, :limit => 200
      # 12.2
      t.integer :mother_has_id
      # 12.3
      t.integer :birth_certificate, :limit => 1
      # 12.4
      t.integer :home_kitchen
      t.integer :home_toilet
      t.integer :home_latrine
      t.integer :home_sewerage
      t.integer :home_shower
      t.integer :home_water
      t.integer :home_electricity
      t.integer :home_tv
      t.integer :home_phone
      t.integer :home_radio
      t.integer :home_computer
      t.integer :home_internet
      # 12.5
      t.integer :number_of_people_under_18, :limit => 2
      # 12.6
      t.integer :number_of_people_over_18, :limit => 2
      # 12.7
      t.integer :mother_activity, :limit => 2
      t.integer :mother_activity_other, :limit => 200
      t.integer :father_activity, :limit => 2
      t.integer :father_activity_other, :limit => 200
      t.integer :caregiver_activity, :limit => 2
      t.integer :caregiver_activity_other, :limit => 200
      # 13.1
      t.integer :separated_settlement
      # 13.2
      t.integer :roma_village

      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
  end
end
