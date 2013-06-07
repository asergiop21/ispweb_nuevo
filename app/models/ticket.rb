class Ticket < ActiveRecord::Base
has_ancestry
attr_accessible :customer_id, :role_id, :issue, :message, :path_id, :priority, :reply, :status, :user_id, :parent_id
 
  has_many :ticket_and_role
  has_many :role, :through => :ticket_and_role
  belongs_to :customer
  belongs_to :user
 # belongs_to :role

#  accepts_nested_attributes_for :ticket_and_role

  PRIORITY = %w[NORMAL URGENTE]

  def to_s
    "#{role}"    
  end
  end

