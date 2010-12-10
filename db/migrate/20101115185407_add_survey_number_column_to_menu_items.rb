class AddSurveyNumberColumnToMenuItems < ActiveRecord::Migration
  def self.up
    add_column('surveys','locality_code_id',:integer,:limit => 3)
    add_column('surveys','mediator_id',:integer,:limit => 3)
    add_column('surveys','mediator_survey_counter',:string,:limit => 10)
  end

  def self.down
  end
end
