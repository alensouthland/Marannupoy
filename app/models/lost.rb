class Lost < ActiveRecord::Base
  validates :lost_item_name, :lost_item_desc, :lost_phone_no, :presence => true
  validates :lost_phone_no, :length => { :minimum => 10 }
end
