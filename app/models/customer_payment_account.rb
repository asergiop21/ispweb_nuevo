class CustomerPaymentAccount < ActiveRecord::Base
        has_ancestry
        attr_accessible :amount_deposited, :current_balance, :customer_id, :invoice_id
        belongs_to :customer
        before_save :payment

        #       def initialize(attributes = nil, options = {})
        #               super(attributes,options)
        #       end
        private 
        def payment

                if self.amount_deposited > 0
                        p "Facturas Pendientes" 
                        p  invoice_pending = Invoice.where('customer_id = ? and status = ?', self.customer_id, false).order('created_at').first
                        if invoice_pending != nil
                                #       pry 
                                p"Pagos Parciales"
                                p  partial_payment = CustomerPaymentAccount.where('invoice_id = ?', invoice_pending.id).sum(&:amount_deposited)
                                if partial_payment > 0 
                                        payment_inv = partial_payment + self.amount_deposited
                                else
                                        payment_inv = self.amount_deposited
                                end
                                p "Deposito - pendiente"
                                p     debt_pay = invoice_pending.debt - payment_inv
                                self.amount_deposited = debt_pay
                                p "resto de pagos"
                                if debt_pay = 0 
                                        Invoice.find(invoice_pending.id).update_attribute(:status, true)
                                        self.invoice_id = invoice_pending.id
                                elsif debt_pay > 0
                                        Invoice.find(invoice_pending.id).update_attribute(:status, true)
                                        self.invoice_id = invoice_pending.id
                                        payment
                                else
                                        self.invoice_id = invoice_pending.id
                                end
                        end
                end
        end




        #        def invoice_payment
        #                invoice_payment = @debt - @payment
        #                if self.invoice_payment == 0
        #                        Invoice.find(invoice_id).update_attribute(:status, true)
        #                        CustomerPaymentAccount.find(self.id).update_attribute(:invoice_id, invoice_id)
        #                        self.amount_deposited = invoice_payment
        #                end
        #        end

        def money_on_account
                self.money = CustomerPaymentAccount.where('customer_id = ? and invoice_id = ?', self.customer_id, nil)
        end                
end   
