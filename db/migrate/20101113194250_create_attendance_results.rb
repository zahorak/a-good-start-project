class CreateAttendanceResults < ActiveRecord::Migration
  def self.up
    create_table :attendance_results do |t|
      t.integer :attendance_id
      t.integer :created_by, :limit => 3
      t.date :attendance_period
      t.integer :total_number_of_school_days_in_month
      t.integer :total_days_absent_from_school

      t.timestamps
    end
  end

  def self.down
    drop_table :attendance_results
  end
end
