class AddTranslationColumnsToMenuItemsTable < ActiveRecord::Migration
  def self.up
    add_column('menu_items','name_hu',:string,:limit => 300)
    add_column('menu_items','name_mk',:string,:limit => 300)
    add_column('menu_items','name_ro',:string,:limit => 300)
    add_column('menu_items','name_sk',:string,:limit => 300)
  end

  def self.down
  end
end
