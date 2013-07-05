class Equipment < ActiveRecord::Base
  attr_accessible :comment, :mac, :model_id, :status, :supplier_id

    STATUS = %w[STOCK BAJA REPARACION]
  #before_update :update_if_change_status, only: [:edit, :update] 

  #validations
    validates :mac, :uniqueness => true

  #Relaciones
      has_many :loan
      belongs_to :model
      belongs_to :supplier  

 # def update_if_change_status
  #  if  self.status_changed?
   #   @equipment = Equipment.new(self.equipment)
    #  @equipment.save  
    #end
 # end


end
