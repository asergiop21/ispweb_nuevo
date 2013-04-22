class Loan < ActiveRecord::Base
  attr_accessible :comment, :confirmation_loan, :customer_id, :equipment_id, :status_loan, :technical_id, :user_id

  #Relaciones
    belongs_to :customer
    belongs_to :equipment


end
