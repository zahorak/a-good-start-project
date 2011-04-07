module FamilyProfilesHelper

  def status_non_formal_education(non_formal_education)
    unless non_formal_education.nil?
      non_formal_education == 1 ? I18n.t('Yes') : I18n.t('No')
    else
      raw('<span class="red">?</span>')
    end
  end

  def status_workshops_on_education(workshops_on_education)
    unless workshops_on_education.nil?
      workshops_on_education == 1 ? I18n.t('Yes') : I18n.t('No')
    else
      raw('<span class="red">?</span>')
    end
  end

  def status_parental_involment_in_preschool(parental_involment_in_preschool)
    unless parental_involment_in_preschool.nil?
      parental_involment_in_preschool == 1 ? I18n.t('Yes') : I18n.t('No')
    else
      raw('<span class="red">?</span>')
    end
  end

end
