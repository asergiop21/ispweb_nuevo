class AccountReceivable < ActiveRecord::Base
        attr_accessible :amount, :customer_id, :description, :number_invoice, :user_id
        #Relaciones
        belongs_to :customer
        belongs_to :user

        validates :amount, :customer_id, :description, presence: true
        validate :number_invoice_exists


        def self.abonos
                abonos = AccountReceivable.new
                abonos.amount = 1
                #p "rock zaraza"
                #p abonos.valid?
                #p abonos.errors
                abonos.save!
        end


        def number_invoice_exists
                number_invoice = AccountReceivable.where('customer_id = ? and enabled = ?', self.customer_id, false).last.try(:number_invoice)
                if number_invoice == nil
                        self.number_invoice = AccountReceivable.maximum('number_invoice')
                        if self.number_invoice == nil
                                self.number_invoice = 1
                        else
                                self.number_invoice = self.number_invoice + 1
                        end
                else
                        self.number_invoice = number_invoice
                end
        end
end
