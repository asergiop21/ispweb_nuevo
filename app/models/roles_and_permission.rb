class RolesAndPermission < ActiveRecord::Base
  attr_accessible :scope, :permission_id

  #Relacion
  belongs_to :role
  belongs_to :permission

  def to_i
    "#{permission}"
  end

end
