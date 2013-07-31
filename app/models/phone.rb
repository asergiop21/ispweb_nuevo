class Phone < ActiveRecord::Base


   attr_accessible :phone_number, :phone_prefix, :phone, :user_id, :customer_id

  validates :phone_number, presence: {message: "eroraa"}
  validates_uniqueness_of  :phone_number

end
