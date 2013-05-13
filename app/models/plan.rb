class Plan < ActiveRecord::Base
  attr_accessible :download_speed, :name, :price, :price_surcharges1, :price_surcharges2, :remove, :upload_speed, :user_id

  validates :name, :download_speed, :upload_speed, :price,  :presence => true
  validates :name, length: {maximum: 255}
  validates :download_speed, :upload_speed, numericality: {only_integer: true}, length: {maximum: 5}
  validates :price, :price_surcharges1, :price_surcharges2, numericality: true, allow_blank: true, allow_nil: true
  validates :price, :price_surcharges1, :price_surcharges2, length:{maximum: 8}


  belongs_to :user

end
