class Customer < ActiveRecord::Base
  #Atributos
  attr_accessible :address, :bar_code, :date_of_birth, :category, :cuit, :description, :dni, :email, :lastname, :name, :neighborhood, :reference_direction, :removed, :phones_attributes, :location_id, :plans_id

  #Relaciones
  has_many :phones
  has_many :loans

  #Validaciones
  validates :name, :lastname, :address, :date_of_birth, :dni, :email,  :location_id, presence: true
  
  
  accepts_nested_attributes_for :phones, :reject_if => lambda {|a| a[:phone_number].blank?}, :allow_destroy => true

 def self.search (q=nil)
               self.connection.execute(sanitize_sql(["SELECT * FROM customers "]))
#      else
 #    self.connection.execute("SELECT * FROM customers ")
                                                                                 end

       end
