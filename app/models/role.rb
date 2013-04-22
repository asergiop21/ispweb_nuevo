class Role < ActiveRecord::Base
  attr_accessible :role

 #Relacion 
  has_and_belongs_to_many :user
  has_many :roles_and_permission
  has_many :permission, :through => :roles_and_permission
end
