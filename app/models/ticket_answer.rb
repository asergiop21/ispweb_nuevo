class TicketAnswer < ActiveRecord::Base
  attr_accessible :message
  belongs_to :ticket

end
