class Phone < ActiveRecord::Base
   attr_accessible :phone_number, :phone_prefix, :phone, :user_id, :customer_id


#  validates_presence_of  :phones, :unless => lambda {self.phone_number.blank?}
  validates_uniqueness_of  :phone_number

  belongs_to :customer
end
