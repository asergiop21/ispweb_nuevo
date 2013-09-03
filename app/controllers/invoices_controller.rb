class InvoicesController < ApplicationController
before_filter :load_customer,  :except => [:close_invoice] 

  def close_invoice
      @close = Invoice.close
  end

  def index
    @invoices = @customer.invoices.all
  end

private
  def load_customer
    @customer = Customer.find(params[:customer_id])
  end
end
