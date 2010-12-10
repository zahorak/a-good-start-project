class Add71WishedEducationToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Higher education / University', :position => 1, :category => 'wished_education')
    mi.save
    mi = MenuItem.new(:name => 'Finishing vocational secondary education', :position => 3, :category => 'wished_education')
    mi.save
    mi = MenuItem.new(:name => 'Finishing general secondary education (grammar school)', :position => 4, :category => 'wished_education')
    mi.save
    mi = MenuItem.new(:name => 'Finishing compulsory education (9 or 10 years of primary education)', :position => 5, :category => 'wished_education')
    mi.save
    mi = MenuItem.new(:name => 'Finishing primary education', :position => 6, :category => 'wished_education')
    mi.save
    mi = MenuItem.new(:name => 'Other', :position => 7, :category => 'wished_education')
    mi.save
    mi = MenuItem.new(:name => 'It makes no difference', :position => 8, :category => 'wished_education')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 9, :category => 'wished_education')
    mi.save
  end

  def self.down
  end
end
