# encoding: utf-8
class AddInstitutionCodesToMenuItemsTable < ActiveRecord::Migration
  def self.up
    mi = MenuItem.new(:name => 'A - at home and not enrolled', :position => 1, :code_id => 999, :category => 'institution_code')
    mi.save
    mi = MenuItem.new(:name => 'B - mother/child programme', :position => 2, :category => 'institution_code')
    mi.save
    mi = MenuItem.new(:name => 'C - crèche', :position => 3, :category => 'institution_code')
    mi.save
    mi = MenuItem.new(:name => 'D - kindergarten', :position => 4, :category => 'institution_code')
    mi.save
    mi = MenuItem.new(:name => 'E - community center', :position => 5, :category => 'institution_code')
    mi.save
    mi = MenuItem.new(:name => 'F - primary school', :position => 6, :category => 'institution_code')
    mi.save
    mi = MenuItem.new(:name => 'G - special primary school', :position => 7, :category => 'institution_code')
    mi.save
    mi = MenuItem.new(:name => 'H - other institution', :position => 8, :category => 'institution_code')
    mi.save
  end

  def self.down
  end
end
