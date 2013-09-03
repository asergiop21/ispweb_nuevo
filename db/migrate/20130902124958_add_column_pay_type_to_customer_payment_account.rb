class AddColumnPayTypeToCustomerPaymentAccount < ActiveRecord::Migration
  def self.up
    add_column :customer_payment_accounts, :pay_type, :decimal, :precision => 8, :scale => 2
    add_column :customer_payment_accounts, :description , :text
    add_column :customer_payment_accounts, :means_of_payment, :integer
    add_column :customer_payment_accounts, :card_number, :integer   
    add_column :customer_payment_accounts, :check_number, :integer
  end

  def self.down
    remove_column :customer_payment_accounts, :pay_type
    remove_column :customer_payment_accounts, :description 
    remove_column :customer_payment_accounts, :means_of_payment
    remove_column :customer_payment_accounts, :card_number 
    remove_column :customer_payment_accounts, :check_number
  end

end
