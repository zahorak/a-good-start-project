class AddLocalityIdToInstitutionsTable < ActiveRecord::Migration
  def self.up
    add_column('institutions','locality_id', :integer, :limit => 2)
  end

  def self.down
  end
end
