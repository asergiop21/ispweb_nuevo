class Invoice < ActiveRecord::Base
   attr_accessible  :debit, :credit, :total_to_pay, :debt, :status, :customer_id

  belongs_to :customer
  scope :close

  def to_s
    self.number_invoice
  end

  def self.close
       @customer = Customer.where(removed: false)
        @customer.each do |p|
          @invoice = Invoice.new
          debit = AccountReceivable.where('customer_id = ? and enabled = ?', p , false).sum(&:amount)
          current_balance = CustomerPaymentAccount.where(customer_id: p).last.try(:current_balance)
            if current_balance == nil || current_balance == 0 
                total_to_pay = debit
                debt = total_to_pay
                status = false
            else
                if current_balance >= debit
                    total_to_pay = 0
                    debt = 0
                    status = true
                    credit = debit 
                    current_balance = current_balance - debit
                else
                    total_to_pay = debit - current_balance
                    debt = total_to_pay
                    status = false
                    credit = current_balance 
                end      
            end

      Invoice.create!(
                      debit: debit, 
                      credit:  credit, 
                      total_to_pay: total_to_pay,
                      debt: debt,
                      status: status,
                      customer_id: p.id )
      end
  end
  end
