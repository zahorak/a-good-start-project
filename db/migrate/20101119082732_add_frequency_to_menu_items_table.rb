class AddFrequencyToMenuItemsTable < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name_en => 'No', :position => 1, :category => 'frequency')
    mi.save
    mi = MenuItem.new(:name_en => 'Sometimes', :position => 2, :category => 'frequency')
    mi.save
    mi = MenuItem.new(:name_en => 'Yes, often', :position => 3, :category => 'frequency')
    mi.save
  end

  def self.down
  end
end
