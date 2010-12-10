class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.integer :child_id, :limit => 5
      t.integer :family_id, :limit => 5
      t.integer :institution_id, :limit => 3
      t.integer :created_by, :limit => 3
      t.integer :after_school_instruction, :limit => 1
      t.integer :extracurricular_activities, :limit => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
