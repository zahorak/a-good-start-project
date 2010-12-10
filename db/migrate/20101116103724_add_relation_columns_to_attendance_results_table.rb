class AddRelationColumnsToAttendanceResultsTable < ActiveRecord::Migration
  def self.up
    add_column('attendance_results','child_id',:integer,:limit => 6)
    rename_column('attendance_results','attendance_id','family_id')
  end

  def self.down
  end
end
