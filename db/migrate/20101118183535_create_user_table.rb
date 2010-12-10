class CreateUserTable < ActiveRecord::Migration
    def self.up
      create_table :users do |t|
        t.string :first_name, :limit => 100
        t.string :last_name, :limit => 100
        t.string :category, :limit => 20

        t.timestamps
      end
    end

  def self.down
  end
end
