class Add102FrequencyExtendedToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Yes, very often', :position => 1, :category => 'frequency_extended')
    mi.save
    mi = MenuItem.new(:name => 'Yes, sometimes', :position => 2, :category => 'frequency_extended')
    mi.save
    mi = MenuItem.new(:name => 'No, hardly ever', :position => 3, :category => 'frequency_extended')
    mi.save
    mi = MenuItem.new(:name => 'No, never', :position => 4, :category => 'frequency_extended')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 5, :category => 'frequency_extended')
    mi.save
  end

  def self.down
  end
end
