class Plan < ActiveRecord::Base
  attr_accessible :download_speed, :integer, :name, :price, :price_surcharges1, :price_surcharges2, :remove, :upload_speed
end
