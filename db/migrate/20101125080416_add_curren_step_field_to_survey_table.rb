class AddCurrenStepFieldToSurveyTable < ActiveRecord::Migration
  def self.up
    add_column('surveys','current_step', :integer, :limit => 1)
  end

  def self.down
  end
end
