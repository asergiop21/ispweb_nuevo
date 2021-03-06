class Ticket < ActiveRecord::Base
has_ancestry



scope :pending,->(user_id){where(role_id: user_id, status: 'pendiente')}
scope :urgent,->(user_id){where(role_id: user_id, status: 'Urgente')}
scope :technical_visit,->{where(role_id: '3', status:'pendiente')} 

attr_accessible :customer_id, :role_id, :issue, :message, :path_id, :priority, :reply, :status, :user_id, :parent_id, :prioritycss, :ticket_answer_attributes

  has_many :ticket_and_role
  has_many :role, :through => :ticket_and_role
  has_many :ticket_answer
  belongs_to :customer
  belongs_to :user

  accepts_nested_attributes_for :ticket_answer, :reject_if => lambda{|a| a[:message].blank?}, :allow_destroy => true

  validates_presence_of :issue, :message, :priority, :role_id
  validates :issue, length: { maximum: 100 } 

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

