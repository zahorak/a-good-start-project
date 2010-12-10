class Add127ActivitiesToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'employed', :position => 1, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'pensioner', :position => 2, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'self-employed', :position => 3, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'student', :position => 4, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'lives abroad', :position => 5, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'unemployed and without any other job', :position => 6, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'on maternity leave', :position => 7, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'works outside official employment', :position => 8, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'housewife', :position => 9, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'other', :position => 10, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'farmer', :position => 11, :category => 'activity')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 12, :category => 'activity')
    mi.save
  end

  def self.down
  end
end
