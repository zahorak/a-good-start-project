class CreateSchoolResults < ActiveRecord::Migration
  def self.up
    create_table :school_results do |t|
      t.integer :child_id, :limit => 5
      t.integer :family_id, :limit => 5
      t.integer :institution_id, :limit => 3
      t.integer :created_by, :limit => 3
      t.boolean :school_readiness_test_passed
      t.integer :type_of_school_enrolled_to, :limit => 1
      t.integer :type_of_class_enrolled_to, :limit => 1
      t.integer :gpa_in_first_grade

      t.timestamps
    end
  end

  def self.down
    drop_table :school_results
  end
end
