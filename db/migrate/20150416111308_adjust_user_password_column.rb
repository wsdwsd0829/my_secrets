class AdjustUserPasswordColumn < ActiveRecord::Migration
  def up
    remove_column "users", "password"
    add_column "users", "password_digest", :string
  end
  def down
    remove_column "users", "password_digest", :string
    add_column "users", "password", :default => "", :null => false,:limit => 40
  end
end
