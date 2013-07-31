class Ip < ActiveRecord::Base
  attr_accessible :ip_ap, :ip_device, :plan_id

  belongs_to :customer
  validates_uniqueness_of :ip_device 

end
