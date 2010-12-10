class RenameCodeInLocalityTable < ActiveRecord::Migration
  def self.up
    rename_column(:surveys, :locality_code_id, :locality_id)
  end

  def self.down
  end
end
