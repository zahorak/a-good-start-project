class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :title, :limit => 40
      t.integer :language_id, :limit => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
