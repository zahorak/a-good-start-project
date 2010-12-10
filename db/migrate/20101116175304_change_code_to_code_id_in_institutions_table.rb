class ChangeCodeToCodeIdInInstitutionsTable < ActiveRecord::Migration
  def self.up
    rename_column(:institutions, :code, :code_id)
    change_column(:institutions, :code_id, :integer, :limit => 3)
  end

  def self.down
  end
end
