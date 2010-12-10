class AddCodeToUserTable < ActiveRecord::Migration
  def self.up
    add_column(:users, :code, :string, :limit => 5)
  end

  def self.down
  end
end
