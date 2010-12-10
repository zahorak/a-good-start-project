class Add86ClassicExtendedToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Yes', :position => 1, :category => 'classic_extended')
    mi.save
    mi = MenuItem.new(:name => 'No', :position => 2, :category => 'classic_extended')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know', :position => 3, :category => 'classic_extended')
    mi.save
    mi = MenuItem.new(:name => 'No answer', :position => 4, :category => 'classic_extended')
    mi.save
  end

  def self.down
  end
end
