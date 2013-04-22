class Equipment < ActiveRecord::Base
  attr_accessible :comment, :mac, :model_id, :state, :supplier_id

  #valitations
  validates :mac, :uniqueness => true

  #Relaciones
    has_many :loans
    belongs_to :model
    STATE = %w[STOCK BAJA]


end
