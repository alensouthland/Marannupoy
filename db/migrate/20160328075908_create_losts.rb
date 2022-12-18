class CreateLosts < ActiveRecord::Migration
  def change
    create_table :losts do |t|
    	t.string "lost_item_name", :limit => 25
        t.text "lost_item_desc", :limit => 100
        t.bigint "lost_phone_no", :limit => 5, :null => false
        t.date "lost_date"
        t.string "lost_place", :limit => 15
        t.boolean "l_lost_flag", :default => true
        t.string "lost_auth_key"
        
      t.timestamps null: false
    end
  end
end
