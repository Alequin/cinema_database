require("pry-byebug")
require_relative("../models/customer.rb")

Customer.delete_all()

customer_1 = Customer.new({
  "name" => "Tommy Atkins",
  "money" => 100
})

customer_1.save()

# binding.pry
# nil
