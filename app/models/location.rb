class Location < ActiveRecord::Base
  attr_accessible :country, :departament, :name, :province, :zipcode
end
