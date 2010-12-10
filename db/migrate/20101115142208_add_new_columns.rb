class AddNewColumns < ActiveRecord::Migration
  def self.up
    add_column('institutions', 'code', :string, :limit => 1)
    rename_column('menu_items', 'title', 'name')
    add_column('menu_items', 'position', :integer, :limit => 2)
    change_column('menu_items', 'language_id', :integer, :limit => 1, :default => 1)
  end

  def self.down
    remove_column('institutions', 'code')
    rename_column('menu_items', 'name', 'title')
    remove_column('menu_items', 'position')
  end
end
