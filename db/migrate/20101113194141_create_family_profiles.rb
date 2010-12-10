class CreateFamilyProfiles < ActiveRecord::Migration
  def self.up
    create_table :family_profiles do |t|
      t.integer :survey_id, :limit => 6
      t.integer :created_by, :limit => 3
      # 2.1
      t.string :family_name, :limit => 100
      # 2.2
      t.integer :fathers_age, :limit => 2
      # 2.3
      t.integer :mothers_age, :limit => 2
      # 2.4
      t.integer :number_of_children, :limit => 2
      # 2.5
      t.integer :number_of_children_below_seven, :limit => 2
      t.integer :household_in_settlement, :limit => 1
      t.text :comment, :limit => 3000

      t.timestamps
    end
  end

  def self.down
    drop_table :family_profiles
  end
end
