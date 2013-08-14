class Invoice < ActiveRecord::Base
   attr_accessible :number_invoice

  def to_s
    self.number_invoice
  end
  end
