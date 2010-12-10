class Add113RomaToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'All / Almost all Roma', :position => 1, :category => 'roma')
    mi.save
    mi = MenuItem.new(:name => 'Around half Roma', :position => 2, :category => 'roma')
    mi.save
    mi = MenuItem.new(:name => 'A few Roma', :position => 3, :category => 'roma')
    mi.save
    mi = MenuItem.new(:name => 'My child is the only Roma', :position => 4, :category => 'roma')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know/ No answer', :position => 5, :category => 'roma')
    mi.save
  end

  def self.down
  end
end
