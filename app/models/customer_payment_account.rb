class CustomerPaymentAccount < ActiveRecord::Base


  attr_accessible :amount_depostied, :current_balance, :customer_id, :debt

  belongs_to :customer

  before_save :calculate
 
private 
def calculate
      debt_invoice = Invoice.where('customer_id = ?',self.customer_id).sum(&:debit)
    
      self.debt = debt_invoice 

  end

end
