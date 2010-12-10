# encoding: utf-8
class CreateLocalities < ActiveRecord::Migration
    def self.up
      create_table :localities do |t|
        t.integer :country_id, :limit => 2
        t.string :code, :limit => 2
        t.string :city, :limit => 100

        t.timestamps
      end

      l = Locality.new(:code => 'NY', :city => 'Nyíregyháza', :country_id => 1)
      l.save
      l = Locality.new(:code => 'MA', :city => 'Mátészalka', :country_id => 1)
      l.save
      l = Locality.new(:code => 'AB', :city => 'Abranovce', :country_id => 2)
      l.save
      l = Locality.new(:code => 'BB', :city => 'Banská Bystrica', :country_id => 2)
      l.save
      l = Locality.new(:code => 'MT', :city => 'Martin', :country_id => 2)
      l.save
      l = Locality.new(:code => 'ZB', :city => 'Zborov', :country_id => 2)
      l.save
      l = Locality.new(:code => 'TE', :city => 'Telechiu', :country_id => 3)
      l.save
      l = Locality.new(:code => 'CR', :city => 'Craiova - Mofleni', :country_id => 3)
      l.save
      l = Locality.new(:code => 'SO', :city => 'Šuto Orizari', :country_id => 4)
      l.save
      l = Locality.new(:code => 'CK', :city => 'Crnik', :country_id => 4)
      l.save
      l = Locality.new(:code => 'DE', :city => 'Delchevo', :country_id => 4)
      l.save
      l = Locality.new(:code => 'TR', :city => 'Trabotivište', :country_id => 4)
      l.save
      l = Locality.new(:code => 'VI', :city => 'Vinica', :country_id => 4)
      l.save
      l = Locality.new(:code => 'BL', :city => 'Blatec', :country_id => 4)
      l.save
    end

    def self.down
      drop_table :localities
    end

end

  # HUNGARY 1
  # SLOVAKIA 2
  # ROMANIA 3
  # MACEDONIA 4
  # 
  # Hungary
  # Nyíregyháza: NY
  # Mátészalka: MA
  # Slovakia
  # Abranovce: AB
  # Banská Bystrica: BB
  # Martin: MT
  # Zborov: ZB
  # Romania
  # Telechiu: TE
  # Craiova - Mofleni: CR
  # Macedonia
  # Šuto Orizari SO
  # Crnik CK
  # Delchevo DE
  # Trabotivište TR
  # Vinica VI
  # Blatec BL
