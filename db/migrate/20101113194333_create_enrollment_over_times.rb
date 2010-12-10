class CreateEnrollmentOverTimes < ActiveRecord::Migration
  def self.up
    create_table :enrollment_over_times do |t|
      t.integer :created_by, :limit => 3
      t.string :name_of_educational_institution
      t.date :date_of_info

      t.timestamps
    end
  end

  def self.down
    drop_table :enrollment_over_times
  end
end
