class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.integer :created_by, :limit => 3
      t.string :category
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :institutions
  end
end
