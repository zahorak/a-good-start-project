class Add1114GoodBadToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Very Bad', :position => 1, :category => 'good_bad')
    mi.save
    mi = MenuItem.new(:name => 'Bad', :position => 2, :category => 'good_bad')
    mi.save
    mi = MenuItem.new(:name => 'Good', :position => 3, :category => 'good_bad')
    mi.save
    mi = MenuItem.new(:name => 'Very Good', :position => 4, :category => 'good_bad')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 5, :category => 'good_bad')
    mi.save
  end

  def self.down
  end
end
