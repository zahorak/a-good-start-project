class AddFamilyfFieldsToSurveyTable < ActiveRecord::Migration
  def self.up
    add_column('surveys','fathers_age',:integer,:limit => 3)
    add_column('surveys','mothers_age',:integer,:limit => 3)
  end

  def self.down
  end
end
