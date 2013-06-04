class Equipment < ActiveRecord::Base
  attr_accessible :comment, :mac, :model_id, :status, :supplier_id

    STATUS = %w[STOCK BAJA]
  #valitations
  validates :mac, :uniqueness => true
  

  #Relaciones
      has_many :loan
      belongs_to :model
      belongs_to :supplier  

end
