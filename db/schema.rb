# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110316145042) do

  create_table "articles", :force => true do |t|
    t.string  "title"
    t.string  "subtitle"
    t.text    "intro"
    t.text    "main"
    t.integer "category",    :limit => 2
    t.string  "language_id", :limit => 2, :default => "en"
    t.integer "related_id",  :limit => 3
  end

  create_table "attendance_results", :force => true do |t|
    t.integer  "family_id"
    t.integer  "created_by",                           :limit => 3
    t.date     "attendance_period"
    t.integer  "total_number_of_school_days_in_month"
    t.integer  "total_days_absent_from_school"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "child_id",                             :limit => 8
    t.integer  "institution_id",                       :limit => 8
    t.integer  "extracurricular_activities",           :limit => 1
    t.integer  "life_skill_program",                   :limit => 1
    t.integer  "campaign_on_reading_on_loud",          :limit => 1
    t.integer  "tutoring_at_school",                   :limit => 1
  end

  create_table "attendances", :force => true do |t|
    t.integer  "child_id",                   :limit => 8
    t.integer  "family_id",                  :limit => 8
    t.integer  "institution_id",             :limit => 3
    t.integer  "created_by",                 :limit => 3
    t.integer  "after_school_instruction",   :limit => 1
    t.integer  "extracurricular_activities", :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_profiles", :force => true do |t|
    t.integer  "survey_id",          :limit => 8
    t.integer  "family_id",          :limit => 8
    t.integer  "locality_id",        :limit => 2
    t.integer  "created_by",         :limit => 3
    t.string   "childs_first_name"
    t.string   "childs_last_name"
    t.date     "date_of_birth"
    t.integer  "gender",             :limit => 1
    t.integer  "institution_id",     :limit => 8
    t.integer  "alphabet",           :limit => 1
    t.integer  "reading_words",      :limit => 1
    t.integer  "writing",            :limit => 1
    t.integer  "sentences",          :limit => 1
    t.integer  "numbers",            :limit => 1
    t.integer  "buttons",            :limit => 1
    t.integer  "routine_activities", :limit => 1
    t.integer  "selfconfidence",     :limit => 1
    t.integer  "other_children",     :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marked_for_delete",  :limit => 1
  end

  create_table "countries", :force => true do |t|
    t.string   "title",       :limit => 40
    t.integer  "language_id", :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollment_over_times", :force => true do |t|
    t.integer  "created_by",                      :limit => 3
    t.string   "name_of_educational_institution"
    t.date     "date_of_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_profiles", :force => true do |t|
    t.integer  "survey_id",                       :limit => 8
    t.integer  "created_by",                      :limit => 3
    t.integer  "locality_id",                     :limit => 3
    t.string   "family_name",                     :limit => 100
    t.integer  "fathers_age",                     :limit => 2
    t.integer  "mothers_age",                     :limit => 2
    t.integer  "number_of_children",              :limit => 2
    t.integer  "number_of_children_below_seven",  :limit => 2
    t.integer  "household_in_settlement",         :limit => 1
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "non_formal_education",            :limit => 1
    t.integer  "workshops_on_education",          :limit => 1
    t.integer  "parental_involment_in_preschool", :limit => 1
  end

  create_table "immunizations", :force => true do |t|
    t.integer  "child_id"
    t.integer  "created_by",                             :limit => 3
    t.integer  "child_has_all_obligatory_vaccinations"
    t.integer  "child_has_some_obligatory_vaccinations", :limit => 1
    t.integer  "child_has_no_vaccinations",              :limit => 1
    t.integer  "unknown",                                :limit => 1
    t.text     "comment"
    t.integer  "bcg",                                    :limit => 1
    t.integer  "dtp",                                    :limit => 1
    t.integer  "hib",                                    :limit => 1
    t.integer  "vhb",                                    :limit => 1
    t.integer  "ipv",                                    :limit => 1
    t.integer  "pcv",                                    :limit => 1
    t.integer  "mmr",                                    :limit => 1
    t.date     "survey_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "institutions", :force => true do |t|
    t.integer  "created_by",  :limit => 3
    t.string   "category"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_id",     :limit => 3
    t.integer  "locality_id", :limit => 2
  end

  create_table "localities", :force => true do |t|
    t.integer  "country_id",   :limit => 2
    t.string   "code",         :limit => 2
    t.string   "city",         :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_count"
    t.integer  "complete",     :limit => 1
    t.integer  "verified",     :limit => 1
  end

  create_table "menu_items", :force => true do |t|
    t.integer  "language_id", :limit => 1,   :default => 1
    t.string   "name_en",     :limit => 60
    t.string   "category",    :limit => 60
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",    :limit => 2
    t.string   "name_hu",     :limit => 300
    t.string   "name_mk",     :limit => 300
    t.string   "name_ro",     :limit => 300
    t.string   "name_sk",     :limit => 300
    t.integer  "enabled",     :limit => 1,   :default => 1
  end

  create_table "registrations", :force => true do |t|
    t.integer "user_id",     :limit => 8
    t.integer "locality_id", :limit => 2
  end

  create_table "school_results", :force => true do |t|
    t.integer  "child_id",                           :limit => 8
    t.integer  "family_id",                          :limit => 8
    t.integer  "institution_id",                     :limit => 3
    t.integer  "created_by",                         :limit => 3
    t.boolean  "school_readiness_test_passed"
    t.integer  "type_of_school_enrolled_to",         :limit => 1
    t.integer  "type_of_class_enrolled_to",          :limit => 1
    t.integer  "gpa_in_first_grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "test_before_school",                 :limit => 3
    t.integer  "test_before_school_result",          :limit => 3
    t.string   "test_before_school_result_other",    :limit => 200
    t.integer  "proceeded_to_next year",             :limit => 3
    t.integer  "average_school_marks_midterm_10_11", :limit => 2
    t.integer  "average_school_marks_yearend_10_11", :limit => 2
    t.integer  "average_school_marks_midterm_11_12", :limit => 2
  end

  create_table "surveys", :force => true do |t|
    t.integer  "family_id",                                           :limit => 3
    t.integer  "created_by",                                          :limit => 3
    t.integer  "verified",                                            :limit => 1
    t.integer  "current_step",                                        :limit => 2,   :default => 1
    t.integer  "locality_id",                                         :limit => 3
    t.date     "date_of_the_interview"
    t.integer  "duration_of_interview"
    t.integer  "interviewer_id"
    t.string   "household_address_street",                            :limit => 100
    t.string   "household_address_city",                              :limit => 100
    t.string   "household_address_country",                           :limit => 100
    t.string   "household_address_zip",                               :limit => 100
    t.integer  "phone_number"
    t.integer  "number_of_all_children",                              :limit => 2
    t.integer  "number_of_children_below_seven",                      :limit => 2
    t.text     "comment"
    t.integer  "relation_to_children",                                :limit => 1
    t.string   "relation_to_children_other",                          :limit => 100
    t.integer  "primary_caregiver",                                   :limit => 1
    t.integer  "who_is_primary_caregiver",                            :limit => 1
    t.string   "who_is_primary_caregiver_other",                      :limit => 200
    t.integer  "primary_caregiver_age",                               :limit => 2
    t.integer  "language_hungarian",                                  :limit => 1
    t.integer  "language_macedonian",                                 :limit => 1
    t.integer  "language_romani",                                     :limit => 1
    t.integer  "language_romanian",                                   :limit => 1
    t.integer  "language_slovak",                                     :limit => 1
    t.string   "language_other",                                      :limit => 200
    t.integer  "children_language_hungarian",                         :limit => 1
    t.integer  "children_language_macedonian",                        :limit => 1
    t.integer  "children_language_romani",                            :limit => 1
    t.integer  "children_language_romanian",                          :limit => 1
    t.integer  "children_language_slovak",                            :limit => 1
    t.string   "children_language_other",                             :limit => 200
    t.integer  "better_in_school",                                    :limit => 1
    t.integer  "kindergarten_importance",                             :limit => 1
    t.integer  "wished_daugters_education",                           :limit => 1
    t.text     "wished_daugters_education_other"
    t.integer  "wished_sons_education",                               :limit => 1
    t.text     "wished_sons_education_other"
    t.integer  "boys_girls_success_importance",                       :limit => 1
    t.integer  "immunization_importance",                             :limit => 1
    t.integer  "immunization_in_household",                           :limit => 1
    t.integer  "immunization_information_source_doctor"
    t.integer  "immunization_information_source_nurse"
    t.integer  "immunization_information_source_mediator"
    t.integer  "immunization_information_source_no_info"
    t.integer  "immunization_information_source_do_not_know"
    t.text     "immunization_information_source_nurse_other"
    t.integer  "visited_hospital_during_pregnancy",                   :limit => 1
    t.integer  "talked_about_pregnancy",                              :limit => 1
    t.text     "talked_about_pregnancy_other"
    t.integer  "doctor_visit_after_birth",                            :limit => 1
    t.integer  "breastfeeding_importance",                            :limit => 1
    t.integer  "childs_development_information_source_no_need"
    t.integer  "childs_development_information_source_books"
    t.integer  "childs_development_information_source_newspapers"
    t.integer  "childs_development_information_source_tv"
    t.integer  "childs_development_information_source_other_persons"
    t.string   "childs_development_information_source_others"
    t.integer  "childs_development_information_source_no_idea"
    t.integer  "book_reading_mother"
    t.integer  "book_reading_father"
    t.string   "book_reading_other",                                  :limit => 100
    t.integer  "book_reading_noone"
    t.integer  "tell_stories_mother"
    t.integer  "tell_stories_father"
    t.string   "tell_stories_other",                                  :limit => 100
    t.integer  "tell_stories_noone"
    t.integer  "play_mother"
    t.integer  "play_father"
    t.string   "play_other",                                          :limit => 100
    t.integer  "play_noone"
    t.integer  "draw_mother"
    t.integer  "draw_father"
    t.string   "draw_other",                                          :limit => 100
    t.integer  "draw_noone"
    t.integer  "teach_letters_mother"
    t.integer  "teach_letters_father"
    t.string   "teach_letters_other",                                 :limit => 100
    t.integer  "teach_letters_noone"
    t.integer  "homework_mother"
    t.integer  "homework_father"
    t.string   "homework_other",                                      :limit => 100
    t.integer  "homework_noone"
    t.integer  "homework_no_child_in_school_yet"
    t.integer  "book_count",                                          :limit => 2
    t.integer  "separate_place"
    t.integer  "reason_for_creche_likes"
    t.integer  "reason_for_creche_free_meal"
    t.integer  "reason_for_creche_time"
    t.integer  "reason_for_creche_trust"
    t.integer  "reason_for_creche_friendships"
    t.integer  "reason_for_creche_playing"
    t.integer  "reason_for_creche_learning"
    t.integer  "reason_for_creche_language"
    t.integer  "reason_for_creche_no_answer"
    t.string   "reason_for_creche_other",                             :limit => 200
    t.integer  "talk_with_teacher",                                   :limit => 1
    t.integer  "reason_not_attend_expensive"
    t.integer  "reason_not_attend_no_creche"
    t.integer  "reason_not_attend_no_place"
    t.integer  "reason_not_attend_no_work"
    t.integer  "reason_not_attend_no_trust"
    t.integer  "reason_not_attend_bad_treating"
    t.integer  "reason_not_attend_language"
    t.integer  "reason_not_attend_family"
    t.integer  "reason_not_attend_no_answer"
    t.string   "reason_not_attend_other",                             :limit => 200
    t.integer  "reason_for_kindergarten_likes"
    t.integer  "reason_for_kindergarten_free_meal"
    t.integer  "reason_for_kindergarten_time"
    t.integer  "reason_for_kindergarten_trust"
    t.integer  "reason_for_kindergarten_friendships"
    t.integer  "reason_for_kindergarten_better_chance"
    t.integer  "reason_for_kindergarten_playing"
    t.integer  "reason_for_kindergarten_learning"
    t.integer  "reason_for_kindergarten_language"
    t.integer  "reason_for_kindergarten_compulsory"
    t.string   "reason_for_kindergarten_other",                       :limit => 200
    t.integer  "reason_for_kindergarten_no_answer"
    t.integer  "kindergarten_days",                                   :limit => 1
    t.integer  "kindergarten_roma",                                   :limit => 1
    t.integer  "class_roma",                                          :limit => 1
    t.integer  "teacher_informs",                                     :limit => 1
    t.integer  "lesson_language_understanding",                       :limit => 1
    t.integer  "teacher_help",                                        :limit => 1
    t.integer  "reason_not_enrolled_no_like"
    t.integer  "reason_not_enrolled_expensive"
    t.integer  "reason_not_enrolled_no_clothes"
    t.integer  "reason_not_enrolled_no_work"
    t.integer  "reason_not_enrolled_trust"
    t.integer  "reason_not_enrolled_children_treating"
    t.integer  "reason_not_enrolled_not_nearby"
    t.integer  "reason_not_enrolled_no_place"
    t.integer  "reason_not_enrolled_family"
    t.integer  "reason_not_enrolled_language"
    t.string   "reason_not_enrolled_other",                           :limit => 200
    t.integer  "reason_not_enrolled_no_answer"
    t.integer  "school_roma",                                         :limit => 1
    t.integer  "school_class_roma",                                   :limit => 1
    t.integer  "school_teacher_information",                          :limit => 1
    t.integer  "lesson_difficulty",                                   :limit => 1
    t.integer  "are_teachers_helpfull",                               :limit => 1
    t.integer  "school_good_bad",                                     :limit => 1
    t.integer  "test_before_school",                                  :limit => 1
    t.integer  "test_before_school_result",                           :limit => 1
    t.string   "test_before_school_other",                            :limit => 200
    t.integer  "school_mother",                                       :limit => 1
    t.string   "school_mother_other",                                 :limit => 200
    t.integer  "school_father",                                       :limit => 1
    t.string   "school_father_other",                                 :limit => 200
    t.integer  "school_caregiver",                                    :limit => 1
    t.string   "school_caregiver_other",                              :limit => 200
    t.integer  "mother_has_id"
    t.integer  "birth_certificate",                                   :limit => 1
    t.integer  "home_kitchen"
    t.integer  "home_toilet"
    t.integer  "home_latrine"
    t.integer  "home_sewerage"
    t.integer  "home_shower"
    t.integer  "home_water"
    t.integer  "home_electricity"
    t.integer  "home_tv"
    t.integer  "home_phone"
    t.integer  "home_radio"
    t.integer  "home_computer"
    t.integer  "home_internet"
    t.integer  "number_of_people_under_18",                           :limit => 2
    t.integer  "number_of_people_over_18",                            :limit => 2
    t.integer  "mother_activity",                                     :limit => 2
    t.string   "mother_activity_other",                               :limit => 200
    t.integer  "father_activity",                                     :limit => 2
    t.string   "father_activity_other",                               :limit => 200
    t.integer  "caregiver_activity",                                  :limit => 2
    t.string   "caregiver_activity_other",                            :limit => 200
    t.integer  "separated_settlement"
    t.integer  "roma_village"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mediator_id",                                         :limit => 3
    t.string   "mediator_survey_counter",                             :limit => 10
    t.integer  "fathers_age",                                         :limit => 3
    t.integer  "mothers_age",                                         :limit => 3
    t.integer  "language_albanian"
    t.integer  "children_language_albanian"
    t.boolean  "talked_about_pregnancy_doctor"
    t.boolean  "talked_about_pregnancy_nurse"
    t.boolean  "talked_about_pregnancy_community_mediator"
    t.boolean  "talked_about_pregnancy_health_mediator"
    t.boolean  "talked_about_pregnancy_noone"
    t.boolean  "book_reading_no_answer"
    t.boolean  "tell_stories_no_answer"
    t.boolean  "play_no_answer"
    t.boolean  "draw_no_answer"
    t.boolean  "teach_letters_no_answer"
    t.boolean  "homework_no_answer"
    t.boolean  "talked_about_pregnancy_no_answer"
    t.integer  "marked_for_delete",                                   :limit => 1
    t.integer  "roma",                                                :limit => 1
    t.integer  "mothers_age_at_first_pregnancy",                      :limit => 2
    t.integer  "completed",                                           :limit => 1
  end

  create_table "tolk_locales", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_locales", ["name"], :name => "index_tolk_locales_on_name", :unique => true

  create_table "tolk_phrases", :force => true do |t|
    t.text     "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tolk_translations", :force => true do |t|
    t.integer  "phrase_id"
    t.integer  "locale_id"
    t.text     "text"
    t.text     "previous_text"
    t.boolean  "primary_updated", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_translations", ["phrase_id", "locale_id"], :name => "index_tolk_translations_on_phrase_id_and_locale_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "first_name",           :limit => 100
    t.string   "last_name",            :limit => 100
    t.string   "category",             :limit => 20,  :default => "MED"
    t.string   "code",                 :limit => 5
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language",             :limit => 2
    t.integer  "locality_id",          :limit => 2
    t.string   "localitiess",          :limit => 200
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
