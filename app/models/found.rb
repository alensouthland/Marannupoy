class Found < ActiveRecord::Base
  validates :found_item_name, :found_item_desc, :found_phone_no, :presence => true
  validates :found_phone_no, :length => { :minimum => 10 }
end
