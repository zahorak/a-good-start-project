class Add116LanguageUnderstandingToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'Very difficult - my child doesn\'t understand anything', :position => 1, :category => 'language_understanding')
    mi.save
    mi = MenuItem.new(:name => 'Somewhat difficult', :position => 2, :category => 'language_understanding')
    mi.save
    mi = MenuItem.new(:name => 'Not that difficult - as my child understands almost everything', :position => 3, :category => 'language_understanding')
    mi.save
    mi = MenuItem.new(:name => 'Not difficult at all - as my child understands the language of tuition perfectly', :position => 4, :category => 'language_understanding')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 5, :category => 'language_understanding')
    mi.save
  end

  def self.down
  end
end
