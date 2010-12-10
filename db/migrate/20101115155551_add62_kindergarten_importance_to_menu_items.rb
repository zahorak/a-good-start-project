class Add62KindergartenImportanceToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Not important at all', :position => 1, :category => 'importance')
    mi.save
    mi = MenuItem.new(:name => 'Somewhat important', :position => 2, :category => 'importance')
    mi.save
    mi = MenuItem.new(:name => 'Important', :position => 3, :category => 'importance')
    mi.save
    mi = MenuItem.new(:name => 'Very important', :position => 4, :category => 'importance')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know/ No answer', :position => 5, :category => 'importance')
    mi.save
  end

  def self.down
  end
end
