class AddColumnToSurveysTable < ActiveRecord::Migration
  def self.up
    add_column('surveys','talked_about_pregnancy_no_answer', :boolean, :limit => 1)
  end

  def self.down
  end
end
