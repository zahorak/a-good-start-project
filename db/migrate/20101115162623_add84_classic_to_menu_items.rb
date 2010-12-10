class Add84ClassicToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Yes', :position => 1, :category => 'classic')
    mi.save
    mi = MenuItem.new(:name => 'No', :position => 2, :category => 'classic')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 3, :category => 'classic')
    mi.save
  end

  def self.down
  end
end
