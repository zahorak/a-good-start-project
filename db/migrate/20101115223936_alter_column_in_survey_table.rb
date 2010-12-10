class AlterColumnInSurveyTable < ActiveRecord::Migration
  def self.up
    change_column('surveys', 'relation_to_children_other', :string, :limit => 100)
  end

  def self.down
  end
end
