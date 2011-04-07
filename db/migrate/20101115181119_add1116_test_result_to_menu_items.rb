class Add1116TestResultToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Child entered the first grade of the standard primary school ', :position => 1, :category => 'test_result')
    mi.save
    mi = MenuItem.new(:name => 'Child entered the first grade of the special primary school', :position => 2, :category => 'test_result')
    mi.save
    mi = MenuItem.new(:name => 'Child was sent to a school readiness programme for one year', :position => 3, :category => 'test_result')
    mi.save
    mi = MenuItem.new(:name => 'Child was told to wait one year, so he/she stayed at home', :position => 4, :category => 'test_result')
    mi.save
    mi = MenuItem.new(:name => 'Child was told to wait one year, so he/she went to kindergarten', :position => 5, :category => 'test_result')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 6, :category => 'test_result')
    mi.save
    mi = MenuItem.new(:name => 'Other', :position => 7, :category => 'test_result')
    mi.save
  end

  def self.down
  end
end
