require("pry-byebug")
require_relative("../models/customer.rb")

Customer.delete_all()

customer_1 = Customer.new({
  "name" => "Tommy Atkins",
  "money" => 100
})
customer_2 = Customer.new({
  "name" => "Da kine",
  "money" => 110
})
customer_3 = Customer.new({
  "name" => "Benjaman Kyle",
  "money" => 130
})

customer_1.save()
customer_2.save()
customer_3.save()

customer_1.name = "Jane Doe"
customer_1.update()

customer_4 = Customer.find(customer_1.id)

all_customers = Customer.get_all()

binding.pry
nil
