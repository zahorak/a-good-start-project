module ApplicationHelper
  
  def get_column_data(a)
    unless a.blank?
      # case b
      #  when 'birth_certificate', "mother_has_id", "birth_certificate", "home_kitchen", "home_toilet", "home_latrine", "home_sewerage", "home_shower", "home_water", "home_electricity", "home_tv", "home_phone", "home_radio", "home_computer", "home_internet", "mother_activity", "mother_activity_other", "father_activity", "father_activity_other", "caregiver_activity", "caregiver_activity_other", "separated_settlement", "roma_village"
      #    "school_mother", "school_mother_other", "school_father", "school_father_other", "school_caregiver", "school_caregiver_other",
      MenuItem.find(a).send('name_' + current_user.language)
    end
  end
  
  def get_column_data_i(a,b)
    unless a.blank?
      case b
        when 'family_id'      then FamilyProfile.find(a).family_name
        when 'locality_id'    then Locality.find(a).full_name
        when 'gender'         then MenuItem.find(a).send('name_' + current_user.language)
        when 'institution_id' then Institution.find(a).name
        when 'interviewer_id' then User.find(a).full_name
      end
    end
  end

end
