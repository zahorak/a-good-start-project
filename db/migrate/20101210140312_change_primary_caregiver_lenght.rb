class ChangePrimaryCaregiverLenght < ActiveRecord::Migration
  def self.up
    change_column(:surveys, :primary_caregiver, :integer, :limit => 1)
  end

  def self.down
  end
end
