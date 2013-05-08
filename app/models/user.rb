class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids
  # attr_accessible :title, :body
  validates_presence_of :username
  has_and_belongs_to_many :role
  has_many :customer
  def role?(role)
    return !!self.role.find_by_role(role.to_s.camelize)
  end

end
