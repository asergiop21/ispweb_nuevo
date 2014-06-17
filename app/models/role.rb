class Role < ActiveRecord::Base
  attr_accessible :role

 #Relacion 
#  has_and_belongs_to_many :user
  has_many :user
  has_many :roles_and_permission
  has_many :permission, :through => :roles_and_permission
  
  has_many :ticket_and_role
  has_many :ticket, :through => :ticket_and_role

def to_s
"#{role}"
end

def role_name
  "prueba"
end

end
