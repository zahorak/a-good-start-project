class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
    
    create_table(:users) do |t|
      t.string :first_name, :limit => 100
      t.string :last_name, :limit => 100
      t.string :category, :limit => 20
      t.string :code, :limit => 5
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :users
  end
end
