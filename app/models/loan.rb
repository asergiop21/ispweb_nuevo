class Loan < ActiveRecord::Base
  attr_accessible :comment, :confirmation_loan, :customer_id, :equipment_id, :status_loan, :technical_id, :user_id

  after_create :change_status_loan

  #Relaciones
    belongs_to :customer
    belongs_to :equipment
    belongs_to :user
    
  def change_status_loan
    @equipment = Equipment.find(self.equipment_id)
    @equipment.update_attributes(:status =>'INSTALADO')
  end


end
