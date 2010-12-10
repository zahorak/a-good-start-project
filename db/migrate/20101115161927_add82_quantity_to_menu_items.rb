class Add82QuantityToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Yes, all of them', :position => 1, :category => 'quantity')
    mi.save
    mi = MenuItem.new(:name => 'Some of them', :position => 2, :category => 'quantity')
    mi.save
    mi = MenuItem.new(:name => 'None of them', :position => 3, :category => 'quantity')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 4, :category => 'quantity')
    mi.save
  end

  def self.down
  end
end
