class Ticket < ActiveRecord::Base
has_ancestry
attr_accessible :customer_id, :departament, :issue, :message, :path_id, :priority, :reply, :status, :user_id, :parent_id

  belongs_to :customer


  end

