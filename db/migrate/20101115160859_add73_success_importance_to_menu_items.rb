class Add73SuccessImportanceToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'For boys it is more important to succeed in school', :position => 1, :category => 'success_importance')
    mi.save
    mi = MenuItem.new(:name => 'For girls it is more important to succeed in school', :position => 2, :category => 'success_importance')
    mi.save
    mi = MenuItem.new(:name => 'For boys and girls it is equally important to succeed in school', :position => 3, :category => 'success_importance')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 4, :category => 'success_importance')
    mi.save
  end

  def self.down
  end
end
