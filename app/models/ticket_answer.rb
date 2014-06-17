class TicketAnswer < ActiveRecord::Base
  attr_accessible :message, :ticket_id, :user_id
  belongs_to :ticket

end
