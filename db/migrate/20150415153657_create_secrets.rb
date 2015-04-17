class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.integer "user_id"  #foreign key reference user.id
      t.string "title", :default=>"", :limit=>200
      t.text "content"
      t.boolean "publish", :default=>false, :null=>false
      t.timestamps null: false
    end
  end
end
