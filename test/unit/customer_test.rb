require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

   customer = Customer.new
   assert customer.invalid?
   assert customer.errors[name].any?

end
