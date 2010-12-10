class AddCountries < ActiveRecord::Migration
  def self.up
    mi = Country.new(:title => 'Hungary')
    mi.save
    mi = Country.new(:title => 'Slovakia')
    mi.save
    mi = Country.new(:title => 'Romania')
    mi.save
    mi = Country.new(:title => 'Macedonia')
    mi.save
  end

  def self.down
  end
end
