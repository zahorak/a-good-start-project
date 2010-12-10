class CreateChildProfiles < ActiveRecord::Migration
  def self.up
    create_table :child_profiles do |t|
      t.integer :survey_id, :limit => 6
      t.integer :family_id, :limit => 5
      t.integer :created_by, :limit => 3
      # 3
      t.string :childs_first_name
      t.string :childs_last_name
      t.date :date_of_birth
      t.boolean :gender
      # t.date :date_of_entry_into_project
      # 3
      t.integer :institution_id, :limit => 5
      # 4.1
      t.integer :alphabet, :limit => 3
      # 4.2
      t.integer :reading_words, :limit => 3
      # 4.3
      t.integer :writing, :limit => 3
      # 4.4
      t.integer :sentences, :limit => 3
      # 4.5
      t.integer :numbers, :limit => 3
      # 4.6
      t.integer :buttons, :limit => 3
      # 4.7
      t.integer :routine_activities, :limit => 3
      # 4.8
      t.integer :selfconfidence, :limit => 3
      # 4.9
      t.integer :other_children, :limit => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :child_profiles
  end
end
