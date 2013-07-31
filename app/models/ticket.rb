class Ticket < ActiveRecord::Base
has_ancestry
attr_accessible :customer_id, :role_id, :issue, :message, :path_id, :priority, :reply, :status, :user_id, :parent_id, :prioritycss, :ticket_answer_attributes
 
  has_many :ticket_and_role
  has_many :role, :through => :ticket_and_role
  has_many :ticket_answer
  belongs_to :customer
  belongs_to :user

  accepts_nested_attributes_for :ticket_answer, :reject_if => lambda{|a| a[:message].blank?}, :allow_destroy => true


 # belongs_to :role
#  accepts_nested_attributes_for :ticket_and_role
    
PRIORITY = Hash['Baja' => 'label', 'Normal' => 'label label-warning', 'Urgente' => 'label label-important']
        def initialize(attributes = nil, options = ())
          super
          self.priority = PRIORITY.key(self.prioritycss)
        end
  def priority
  
          self.priority = PRIORITY.key(self.prioritycss)
end
        def to_s
          "#{role}"    
        end

end

