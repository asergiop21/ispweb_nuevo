require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

   test "customer attributes" do
   customer = Customer.new
   assert customer.invalid?
   assert customer.errors[name].any?
   end
end
