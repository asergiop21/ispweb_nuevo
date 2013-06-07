class TicketAndRole < ActiveRecord::Base
  attr_accessible :role_id, :ticket_id, :user_id

  belongs_to :ticket
  belongs_to :role
  belongs_to :user
  def to_s
   "#{self.role}" 
  end


end
