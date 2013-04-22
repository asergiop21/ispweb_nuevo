class Supplier < ActiveRecord::Base
  attr_accessible :address, :location_id, :name, :user_id, :zipcode
end
