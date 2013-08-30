class AccountReceivable < ActiveRecord::Base

  attr_accessible :amount, :customer_id, :description, :number_invoice, :user_id

  #Relaciones
    belongs_to :customer
    belongs_to :user



  def self.abonos

    customer = Customer.find(990)
    plan = Plan.find(customer.plan_id)
    abonos = AccountReceivable.new
    abonos.amount = 1
    abonos.save
  end



end
