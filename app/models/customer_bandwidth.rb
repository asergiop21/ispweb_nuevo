class CustomerBandwidth < ActiveRecord::Base
  attr_accessible :customer, :gdr, :gur, :ip_device, :mdr, :mup
end
