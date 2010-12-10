class AddColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column('users','language', :varchar, :limit => 2)
    add_column('users','locality_id', :integer, :limit => 2)    
  end

  def self.down
  end
end
