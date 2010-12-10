class Add123BirthCertificateToMenuItems < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'YES, all of them', :position => 1, :category => 'birth_certificate')
    mi.save
    mi = MenuItem.new(:name => 'NO, at least one of them DOES NOT HAVE', :position => 2, :category => 'birth_certificate')
    mi.save
    mi = MenuItem.new(:name => 'NONE of them', :position => 3, :category => 'birth_certificate')
    mi.save
    mi = MenuItem.new(:name => 'I don\'t know / No answer', :position => 4, :category => 'birth_certificate')
    mi.save
  end

  def self.down
  end
end
