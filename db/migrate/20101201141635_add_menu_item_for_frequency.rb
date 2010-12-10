class AddMenuItemForFrequency < ActiveRecord::Migration
  def self.up

    mi = MenuItem.new(:name_en => "I don't know / No answer", :name_sk => "Neviem/Neodpoviem", :position => 4, :category => 'frequency')
    mi.save
  end

  def self.down
  end
end
