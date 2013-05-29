class Location < ActiveRecord::Base
  attr_accessible :country, :departament, :name, :province, :zipcode

  has_many :supplier
  has_many :customer
end
