class Phone < ActiveRecord::Base
   attr_accessible :phone_number, :phone_prefix, :phone, :user_id, :customer_id
  
   belongs_to :customer

   validates :phone_number, presence: true
end
