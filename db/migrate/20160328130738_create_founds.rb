class CreateFounds < ActiveRecord::Migration
  def change
    create_table :founds do |t|
    	t.string "found_item_name", :limit => 25
        t.text "found_item_desc", :limit => 100
        t.bigint "found_phone_no", :limit => 5, :null => false
        t.date "found_date"
        t.string "found_place", :limit => 15
        t.boolean "f_lost_flag", :default => true
        t.string "found_auth_key"

      t.timestamps null: false
    end
  end
end
