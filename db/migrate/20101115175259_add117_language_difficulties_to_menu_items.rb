class Add117LanguageDifficultiesToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Very often', :position => 1, :category => 'language_difficulties')
    mi.save
    mi = MenuItem.new(:name => 'Sometimes', :position => 2, :category => 'language_difficulties')
    mi.save
    mi = MenuItem.new(:name => 'Hardly ever', :position => 3, :category => 'language_difficulties')
    mi.save
    mi = MenuItem.new(:name => 'My child has no difficulties with language of tuition', :position => 4, :category => 'language_difficulties')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 5, :category => 'language_difficulties')
    mi.save
  end

  def self.down
  end
end
