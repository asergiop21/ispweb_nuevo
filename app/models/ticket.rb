class Ticket < ActiveRecord::Base
has_ancestry
attr_accessible :customer_id, :role_id, :issue, :message, :path_id, :priority, :reply, :status, :user_id, :parent_id
 
 
belongs_to :customer
  belongs_to :user
  belongs_to :role

  PRIORITY = %w[NORMAL URGENTE]

  def to_s
    
  end
  end

