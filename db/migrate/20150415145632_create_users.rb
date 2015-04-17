class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "username",  :limit => 25
      t.string "password", :default => "", :null => false,:limit => 40
      t.string "email"
      t.integer "usertype", :default=> 0 # 0 normal user, 1 admin
      t.boolean "status", :default=>1, null:false  # 0 deleted, 1 logged in
      t.timestamps null: false
    end
  end
  def down
    drop_table :users
  end
end
