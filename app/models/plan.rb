class Plan < ActiveRecord::Base
  attr_accessible :download_speed, :name, :price, :price_surcharges1, :price_surcharges2, :remove, :upload_speed, :user_id, :percentage_junk, :support_priority, :upload_speed_vampire, :download_speed_vampire, :percentage_junk_vampire, :start_time, :end_time

  validates :name, :download_speed, :upload_speed, :price,  :presence => true
  validates :name, length: {maximum: 255}
  validates :download_speed, :upload_speed, numericality: {only_integer: true}, length: {maximum: 5}
  validates :price, :price_surcharges1, :price_surcharges2, numericality: true, allow_blank: true, allow_nil: true
  validates :price, :price_surcharges1, :price_surcharges2, length:{maximum: 8}
  validates :support_priority, length:{is: 1}
  validates :support_priority, numericality: {less_than_or_equal_to: 5}
  validates :percentage_junk, numericality: {less_than_or_equal: 100}
  has_many :customer
  belongs_to :user


end
