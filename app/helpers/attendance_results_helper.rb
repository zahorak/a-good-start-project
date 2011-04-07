module AttendanceResultsHelper

  def full_total_number_of_school_days_in_month(total_number_of_school_days_in_month)
    unless total_number_of_school_days_in_month.nil?
      total_number_of_school_days_in_month
    else
      raw('<span class="red">?</span>')
    end
  end

  def full_total_days_absent_from_school(total_days_absent_from_school)
    unless total_days_absent_from_school.nil?
      total_days_absent_from_school
    else
      raw('<span class="red">?</span>')
    end
  end

  def full_extracurricular_activities(extracurricular_activities)
    unless extracurricular_activities.nil?
      extracurricular_activities == 1 ? I18n.t('Yes') : I18n.t('No')
    else
      raw('<span class="red">?</span>')
    end
  end

  def full_life_skill_program(life_skill_program)
    unless life_skill_program.nil?
      life_skill_program == 1 ? I18n.t('Yes') : I18n.t('No')
    else
      raw('<span class="red">?</span>')
    end
  end

  def full_campaign_on_reading_on_loud(campaign_on_reading_on_loud)
    unless campaign_on_reading_on_loud.nil?
      campaign_on_reading_on_loud == 1 ? I18n.t('Yes') : I18n.t('No')
    else
      raw('<span class="red">?</span>')
    end
  end

  def full_tutoring_at_school(tutoring_at_school)
    unless tutoring_at_school.nil?
      tutoring_at_school == 1 ? I18n.t('Yes') : I18n.t('No')
    else
      raw('<span class="red">?</span>')
    end
  end

end
