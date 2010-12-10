class Add61DataToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'If children attend kindergarten or other educational programme before going to primary school', :position => 1, :category => 'better_in_school')
    mi.save
    mi = MenuItem.new(:name => 'If children stay at home before going to primary school', :position => 2, :category => 'better_in_school')
    mi.save
    mi = MenuItem.new(:name => 'There is no difference', :position => 3, :category => 'better_in_school')
    mi.save
    mi = MenuItem.new(:name => 'I dont know / No answer', :position => 4, :category => 'better_in_school')
    mi.save
  end

  def self.down
  end
end
