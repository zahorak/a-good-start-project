class Add121SchoolTypeToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'A. Higher education / University', :position => 1, :category => 'school_type')
    mi.save
    mi = MenuItem.new(:name => 'B. Vocational secondary education', :position => 2, :category => 'school_type')
    mi.save
    mi = MenuItem.new(:name => 'C. General secondary / Grammar', :position => 3, :category => 'school_type')
    mi.save
    mi = MenuItem.new(:name => 'D. Special primary', :position => 4, :category => 'school_type')
    mi.save
    mi = MenuItem.new(:name => 'E. Standard primary school', :position => 5, :category => 'school_type')
    mi.save
    mi = MenuItem.new(:name => 'F. Haven\'t finished primary', :position => 6, :category => 'school_type')
    mi.save
    mi = MenuItem.new(:name => 'G. Did not go to school', :position => 7, :category => 'school_type')
    mi.save
    mi = MenuItem.new(:name => 'I. I don\'t know / No answer', :position => 8, :category => 'school_type')
    mi.save
  end

  def self.down
  end
end
