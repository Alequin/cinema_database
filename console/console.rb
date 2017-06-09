require("pry-byebug")
require_relative("../models/customer.rb")

Customer.delete_all()

customer_1 = Customer.new({
  "name" => "Tommy Atkins",
  "money" => 100
})

customer_1.save()

customer_1.name = "Jane Doe"
customer_1.update()

binding.pry
nil
