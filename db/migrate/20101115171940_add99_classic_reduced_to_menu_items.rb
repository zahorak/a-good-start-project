class Add99ClassicReducedToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Yes', :position => 1, :category => 'classic_reduced')
    mi.save
    mi = MenuItem.new(:name => 'No', :position => 2, :category => 'classic_reduced')
    mi.save
  end

  def self.down
  end
end
