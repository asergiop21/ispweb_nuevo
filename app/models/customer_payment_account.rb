class CustomerPaymentAccount < ActiveRecord::Base


  attr_accessible :amount_depostied, :current_balance, :customer_id
  belongs_to :customer
  before_save :calculate
 
private 
def calculate
      #self.debt = Invoice.where('customer_id = ? and status = ?', self.customer_id, false).sum(&:total_to_pay)

    # current = CustomerPaymentAccount.select(current_balance).where('customer_id = ?', self.customer_id).last
#     current = 0 if current == 0

#      self.current_balance = (self.amount_depostied + BigDecimal.new(current.to_s)) 

  end

end
