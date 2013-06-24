class Customer < ActiveRecord::Base
  #Atributos
  attr_accessible :address, :bar_code, :date_of_birth, :category, :cuit, :description, :dni, :email, :lastname, :name, :neighborhood, :reference_direction, :removed, :phones_attributes, :location_id, :plan_id, :user_id, :invoice

after_create :add_plan_accounts_receivable
  #Relaciones
  has_many :phones, :dependent => :destroy
  has_many :loans
  has_many :tickets, :dependent => :destroy
  belongs_to :user
  belongs_to :plan
  belongs_to :location
  has_many :accounts_receivable

  #Validaciones
  validates :name, :lastname, :address, :date_of_birth, :dni, :category,  :location_id, :plan_id, presence: true
  validates :name, uniqueness: {scope: :lastname}, allow_nil: true, allow_blank: true
  validate :phone_count
  validates :name, :lastname, :address, :neighborhood, :reference_direction, :email, length: {maximum: 255}, allow_nil: true, allow_blank: true 
  validates :dni, length: {is: 8}, numericality: true
  validates :cuit, length: {is: 13}, allow_nil: true, allow_blank: true
  validates :email,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
validates_date :date_of_birth, :before => lambda { 18.years.ago },
                               :before_message => "must be at least 18 years old" 

  accepts_nested_attributes_for :phones, :reject_if => lambda {|a| a[:phone_number].blank? }, allow_destroy: true

  CATEGORY= %w[HOGAR EMPRESA]
  INVOICE = %w[A B C]
 def phone_count
   if self.phones.size < 1
      errors.add(:base, "problemas")
   end
 end

 def self.search (q=nil)
     self.connection.execute(sanitize_sql(["SELECT * FROM customers"]))
 end

  def add_plan_accounts_receivable
    plan =  Plan.find(self.plan_id)
    AccountsReceivable.create(:description => "Abono Mensual - "+ plan.name, :amount => plan.price, :customer_id => self.id, :user_id => self.user_id)
 
end

end
