class AddGenderToMenuItemsTable < ActiveRecord::Migration
  def self.up
    rename_column('menu_items','name','name_en')
    mi = MenuItem.new(:name_en => 'Male', :position => 1, :category => 'gender')
    mi.save
    mi = MenuItem.new(:name_en => 'Female', :position => 2, :category => 'gender')
    mi.save
  end

  def self.down
  end
end
