class InvoicesController < ApplicationController
before_filter :load_customer,  :except => [:close_invoice] 

  def close_invoice
      @close = Invoice.close_invoice
  end

  def index
    @invoices = @customer.invoices.order('created_at')
  end

private
  def load_customer
    @customer = Customer.find(params[:customer_id])
  end
end
