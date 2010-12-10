class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.integer :language_id, :limit => 2
      t.string :title, :limit => 60
      t.string :category, :limit => 60
      t.timestamps
    end
  end

  def self.down
    drop_table :menu_items
  end
end
