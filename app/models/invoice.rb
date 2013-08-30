class Invoice < ActiveRecord::Base
   attr_accessible :number_invoice
  belongs_to :customer
  scope :close

  def to_s
    self.number_invoice
  end

  def self.close
     
       @customer = Customer.all
       
      @customer.each do |p|
      total = AccountReceivable.where('customer_id = ?', p ).sum(&:amount)
       @invoice = Invoice.new
      @invoice.debit = total
      @invoice.customer_id = p.id
      @invoice.save
      end
  end


  end
