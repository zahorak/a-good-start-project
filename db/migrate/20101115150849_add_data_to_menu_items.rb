class AddDataToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Mother', :position => 1, :category => 'relative')
    mi.save
    mi = MenuItem.new(:name => 'Father', :position => 2, :category => 'relative')
    mi.save
    mi = MenuItem.new(:name => 'Grandmother', :position => 3, :category => 'relative')
    mi.save
    mi = MenuItem.new(:name => 'Grandfather', :position => 4, :category => 'relative')
    mi.save
    mi = MenuItem.new(:name => 'Other', :position => 5, :category => 'relative')
    mi.save
  end

  def self.down
  end
end
