class Add85TalkedAboutPregnancyToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Doctor', :position => 1, :category => 'talked_about_pregnancy')
    mi.save
    mi = MenuItem.new(:name => 'Nurse', :position => 2, :category => 'talked_about_pregnancy')
    mi.save
    mi = MenuItem.new(:name => 'Community mediator', :position => 3, :category => 'talked_about_pregnancy')
    mi.save
    mi = MenuItem.new(:name => 'Health mediator', :position => 4, :category => 'talked_about_pregnancy')
    mi.save
    mi = MenuItem.new(:name => 'Other person', :position => 5, :category => 'talked_about_pregnancy')
    mi.save
    mi = MenuItem.new(:name => 'No one', :position => 6, :category => 'talked_about_pregnancy')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 7, :category => 'talked_about_pregnancy')
    mi.save
  end

  def self.down
  end
end
