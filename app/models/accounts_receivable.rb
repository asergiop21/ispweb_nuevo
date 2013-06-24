class AccountsReceivable < ActiveRecord::Base

  attr_accessible :amount, :customer_id, :description, :number_invoice, :user_id

  #Relaciones
    belongs_to :customer
    belongs_to :user

end
